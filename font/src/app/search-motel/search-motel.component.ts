import { Component, Input, OnInit, Output } from '@angular/core';
import { MotelService } from '../services/motel.service';
import { Motel } from '../model/Motel';
import { User } from '../model/User';
import { Router, ActivatedRoute } from '@angular/router'
import { NewType } from '../model/NewType';
import { TypeofnewService } from '../services/newstype.service'
import { MatDialog } from '@angular/material/dialog';
import { DialogSearchMotelComponent } from './dialog-search-motel/dialog-search-motel.component';
import { AuthenticationService } from '../services/authentication.service';
import { Account } from  '../model/Account';
import { UserService } from '../services/user.service'
import { BehaviorSubjectClass } from '../services/behaviorsubject'
import { data } from 'jquery';
import { City } from '../model/City';

@Component({
  selector: 'app-search-motel',
  templateUrl: './search-motel.component.html',
  styleUrls: ['./search-motel.component.css']
})
export class SearchMotelComponent implements OnInit {

  motelsearch: Motel[];
  @Input() motels:Motel[];
  types: NewType[];
  counttypes: NewType[]; // mảng các loại nhà trọ
  arraycounttype: number[] =[]; // đếm số loại nhà trọ
  name:string;

  //Phân trang tổng số trang
  totalRecord: Number;
  page:Number = 1;

  //load tên trên thanh tophead
  nametophead;

  //dialog
  public dialogsearch: Motel;

  //user
  currentAccount: Account;
  users:User[];

  @Output() seach:string = "Mặc định";

  xetvalue = false;



  datasearch;
  datacity;
  constructor(private behaviorSubjectClass:BehaviorSubjectClass,private userService:UserService,private authenticationService: AuthenticationService,public dialog: MatDialog,private typeservice:TypeofnewService,private route: Router,private router: ActivatedRoute,private motelService:MotelService) {
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

  }

  public gettotal(message:number){
    this.totalRecord = message;
  }

  public onNewType(message:string){
    this.datasearch = message;
  }

  public getTypes(){
    this.typeservice.getTypes().subscribe(gettypes => this.types = gettypes)
    
  }

  public getMotelDecreasePrice(){
    this.motels = this.motels.sort((a,b) => Number(b.price) - Number(a.price))
    this.seach = "Gía giảm dần"
  }

  public getMotelIncreasePrice(){
    this.motels = this.motels.sort((a,b) => Number(a.price) - Number(b.price))
    this.seach = "Gía tăng dần"
  }

  public getMotelIncreaseArea(){
    this.motels = this.motels.sort((a,b) => Number(a.areaZone) - Number(b.areaZone))
    this.seach = "Diện tích tăng dần"
  }

  public getMotelDecreaseArea(){
    this.motels = this.motels.sort((a,b) => Number(b.areaZone) - Number(a.areaZone))
    this.seach = "Diện tích giảm dần"
  }

 public getCountTypes(){
    this.typeservice.getCountTypes().subscribe(gettypes => {
      this.counttypes = gettypes
      var motel:Motel[];
      this.motelService.getMotels().subscribe(getmotels => {
        motel = getmotels
      })
      for(let i=0; i<this.counttypes.length; i++){
        
        var count = this.counttypes[i].details.length;
        this.arraycounttype.push(count);
      }
      console.log(this.arraycounttype)
    })
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

  
  public openDialog(): void {
    const dialogRef = this.dialog.open(DialogSearchMotelComponent, {
      direction: "ltr",
      width: '400px',
      data: this.dialogsearch
    });

    dialogRef.afterClosed().subscribe((result: Motel) => {
      if (result)
      {
        console.log('The dialog was closed');
        console.log(result);
      }
        
    });
  }

}
