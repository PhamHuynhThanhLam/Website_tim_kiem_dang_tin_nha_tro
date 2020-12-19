import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
import { DangtinService } from '../serviceapits/dangtin.service';
import { Motel,Image } from '../model/Motel';
import { User } from '../model/User';
import { Router, ActivatedRoute } from '@angular/router'
import { Location } from '@angular/common'
import { Typeofnew } from '../model/Typeofnew';
import { TypeofnewService } from '../serviceapits/typeofnew.service'
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { DialogsearchtimkiemComponent } from './dialogsearchtimkiem/dialogsearchtimkiem.component';
import { AuthenticationService } from '../serviceapits/authentication.service';
import { Account } from  '../model/Account';
import { UserService } from '../serviceapits/user.service'
import { LikeMotel } from '../model/LikeMotel';
import { flatten } from '@angular/compiler';

@Component({
  selector: 'app-trang-tim-kiem',
  templateUrl: './trang-tim-kiem.component.html',
  styleUrls: ['./trang-tim-kiem.component.css']
})
export class TrangTimKiemComponent implements OnInit {

  motelsearch: Motel;
  @Input() motels:Motel[];
  types: Typeofnew[];
  counttypes: Typeofnew[];
  arraycounttype: number[] =[];
  name:string;

  //page
  totalRecord: Number;
  page:Number = 1;

  //load
  NAME;

  //dialog
  public dialogsearch: Motel;

  //user
  currentAccount: Account;
  users:User[];

  toltallike;

  classes = "red-background";
  isDanger = "false";
  idValue : boolean;

  TraiTim;
  

  xetvalue = false;
  savelistmotelclick = "";
  constructor(private userService:UserService,private authenticationService: AuthenticationService,public dialog: MatDialog,private typeservice:TypeofnewService,private route: Router,private router: ActivatedRoute,public dangtinService:DangtinService) {
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
   }


   async ngOnInit(): Promise<void> {

    this.getTypes();
    this.getCountTypes();
    this.isUser();
    this.router.data.subscribe(data => {
      this.name = data.kind;
    })
    console.log(this.name);
    if(this.name == "cho-thue-nha-tro"){
      this.NAME = "Cho thuê phòng trọ, nhà trọ số 1 Việt Nam";
       await this.getmotelbytype("Phòng trọ, nhà trọ");
    }
    if(this.name == "nha-cho-thue"){
      this.NAME = "Cho Thuê Nhà Nguyên Căn, Giá Rẻ, Chính Chủ, Mới Nhất 2020";
      await this.getmotelbytype("Nhà thuê nguyên căn");
    }
    if(this.name == "cho-thue-can-ho"){
      this.NAME = "Cho Thuê Căn Hộ Chung Cư Mini, Căn Hộ Dịch Vụ, Giá Rẻ - Mới Nhất 2020";
      await this.getmotelbytype("Cho thuê căn hộ");
    }
    if(this.name == "cho-thue-mat-bang"){
      this.NAME = "Cho Thuê Mặt Bằng, Cho Thuê Văn Phòng, Cửa Hàng, Kiot";
      await this.getmotelbytype("Cho thuê mặt bằng");
    }
    if(this.name == "tim-nguoi-o-ghep-cap"){
      this.NAME = "Tìm Người Ở Ghép, Tìm Nam Ở Ghép, Tìm Nữ Ở Ghép";
      await this.getmotelbytype("Tìm người ở ghép");
    }

    //this.dangtinService.getSearchMotel().subscribe(motel => this.motelsearch = motel);
    //this.dangtinService.searchmoteluser(this.motelsearch).subscribe(getmotels => this.motels = getmotels);
  }

  public getTypes(){
    this.typeservice.getTypes().subscribe(gettypes => this.types = gettypes)
  }

 

 public getCountTypes(){
    this.typeservice.getCountTypes().subscribe(gettypes => {
      this.counttypes = gettypes
      for(let i=0; i<this.counttypes.length; i++){
        var count = this.counttypes[i].details.length;
        this.arraycounttype.push(count);
      }
      console.log(this.arraycounttype)
    })
  }

  OnChangeColor(idmotel){
    if(this.xetvalue == false){
      if(this.isDanger == "false"){
        this.isDanger = "true";
        this.idValue = true;
        this.savelistmotelclick = this.savelistmotelclick + "," + idmotel;
        console.log(this.savelistmotelclick);
      }
      else if(this.isDanger == "true"){
        //localStorage.setItem('XETTRAITIM', "false");
        this.isDanger = "false";
        this.idValue = false;
      }
    }
    else{

    }
    
    //this.addlike(idmotel);
  }

  linkrouter(name, id) {
    console.log(name + id);
    //this.router.navigate( [{name: name, id: id}]);
    this.route.navigate( ['/home/chitiet',name,id]);
  }

  handlePageChange(event) {
    this.page = event;
  }

  public getMotelSearch(){
    //this.dangtinService.searchmoteluser().subscribe(getcity => this.cities = getcity)
  }

  public getmotelbytype(name) {
    this.dangtinService.getmotelbytype(name).subscribe(motel => {
      this.motels = motel;
      console.log(this.motels);
      this.totalRecord = this.motels.length;
    });
  }

  public isUser() {
    try{
      var role = Number(this.currentAccount.roleId);
    }
    catch(error){    
      if(role == 1){
        this.xetvalue = true;
        console.log(this.xetvalue)
      }
      this.xetvalue = false;
      console.log(this.xetvalue)
    }
    
  }

  public addlike(idmotel: number){
    const user: LikeMotel = new LikeMotel();
    user.idmotel = idmotel;
    user.iduser = this.currentAccount.user.id;
    this.userService.addlike(user).subscribe(insert => {
      this.toltallike++;
    })
  }

  
  openDialog(): void {
    const dialogRef = this.dialog.open(DialogsearchtimkiemComponent, {
      direction: "ltr",
      width: '400px',
      data: this.dialogsearch
    });

    dialogRef.afterClosed().subscribe((result: Motel) => {
      if (result)
      {
        console.log('The dialog was closed');
        console.log(result);
        //if (!this.isEdit) this.createNewExam(result);
        //else this.updateExam(result);
      }
        
    });
  }
}
