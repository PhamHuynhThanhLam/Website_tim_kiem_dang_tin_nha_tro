import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { NewType } from '../../model/NewType';
import { TypeofnewService } from '../../services/newstype.service'
import { MatDialog } from '@angular/material/dialog';
import { AuthenticationService } from '../../services/authentication.service';
import { Account } from  '../../model/Account';
import { UserService } from '../../services/user.service'
import { BehaviorSubjectClass } from '../../services/behaviorsubject'
import { data } from 'jquery';
import { Motel } from '../../model/Motel';
import { User } from '../../model/User';
import { ActivatedRoute, Router } from '@angular/router';
import { MotelService } from 'src/app/services/motel.service';


@Component({
  selector: 'app-data-motel',
  templateUrl: './data-motel.component.html',
  styleUrls: ['./data-motel.component.css']
})
export class DataMotelComponent implements OnInit {

  motelsearch: Motel[];
  @Input() motels:Motel[];
  types: NewType[];
  counttypes: NewType[]; // mảng các loại nhà trọ
  arraycounttype: number[] =[]; // đếm số loại nhà trọ
  name:string;

  //Phân trang tổng số trang
  @Output() totalRecord: EventEmitter<Number> = new EventEmitter<Number>();
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


  @Input() newTypeseach;
  @Input() citySearch;

  filterSearch;
  constructor(private behaviorSubjectClass:BehaviorSubjectClass,private userService:UserService,private authenticationService: AuthenticationService,public dialog: MatDialog,private typeservice:TypeofnewService,private route: Router,private router: ActivatedRoute,private motelService:MotelService) {
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
   }


   async ngOnInit(): Promise<void> {
    this.getTypes();
    this.isUser();
    this.router.data.subscribe(data => {
      this.name = data.kind;
    })
    console.log(this.name);

    if(this.name == "cho-thue-nha-tro"){
      this.nametophead = "Cho thuê phòng trọ, nhà trọ số 1 Việt Nam";
       await this.getMotelByType("Phòng trọ, nhà trọ");
    }
    else if(this.name == "nha-cho-thue"){
      this.nametophead = "Cho Thuê Nhà Nguyên Căn, Giá Rẻ, Chính Chủ, Mới Nhất 2020";
      await this.getMotelByType("Nhà thuê nguyên căn");
    }
    else if(this.name == "cho-thue-can-ho"){
      this.nametophead = "Cho Thuê Căn Hộ Chung Cư Mini, Căn Hộ Dịch Vụ, Giá Rẻ - Mới Nhất 2020";
      await this.getMotelByType("Cho thuê căn hộ");
    }
    else if(this.name == "tim-nguoi-o-ghep-cap"){
      this.nametophead = "Tìm Người Ở Ghép, Tìm Nam Ở Ghép, Tìm Nữ Ở Ghép";
      await this.getMotelByType("Tìm người ở ghép");
    }
    else if(this.name == "cho-thue-mat-bang"){
      this.nametophead = "Cho Thuê Mặt Bằng, Cho Thuê Văn Phòng, Cửa Hàng, Kiot";
      await this.getMotelByType("Cho thuê mặt bằng");
    }
    
    
    
    
    //this.dangtinService.getSearchMotel().subscribe(motel => this.motelsearch = motel);
    //this.dangtinService.searchmoteluser(this.motelsearch).subscribe(getmotels => this.motels = getmotels);
  }

  public onCity(message:string){
    this.motels = this.motelsearch.filter(a => a.city.name == message);
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

  public linkRouter(name, id) {
    console.log(name + id);
    //this.router.navigate( [{name: name, id: id}]);
    this.route.navigate( ['/home/chi-tiet',name,id]);
  }

  public handlePageChange(event) {
    this.page = event;
  }

  public getMotelByType(name) {
    this.motelService.getmotelbytype(name).subscribe(motel => {
      this.motelsearch = motel;
      console.log(this.motelsearch)

      //3
      console.log(localStorage.getItem('province') +"  "+ localStorage.getItem('city') + " "+ localStorage.getItem('searchtext'))
      if(localStorage.getItem('city') != null &&  localStorage.getItem('searchtext') != "NULL" && localStorage.getItem('province') != null ){
        this.motels = this.motelsearch.filter(a => a.city.name == localStorage.getItem('city') && a.province.name == localStorage.getItem('province') && a.address.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()))
        this.totalRecord.emit(this.motels.length);
        console.log(this.motels)
        console.log("province,city,searchtext")
      }

      //1
      if(localStorage.getItem('city') && localStorage.getItem('province') == null && localStorage.getItem('searchtext') === "NULL"){
        this.motels = this.motelsearch.filter(a => a.city.name == localStorage.getItem('city'))
        this.totalRecord.emit(this.motels.length);
        console.log(this.motels)
        console.log("city")

      }

      if(localStorage.getItem('province') && localStorage.getItem('city') == null && localStorage.getItem('searchtext') == "NULL" ){
        this.motels = this.motelsearch.filter(a => a.province.name == localStorage.getItem('province'))
        this.totalRecord.emit(this.motels.length);
        console.log(this.motels)
        console.log("province")

      }

      if(localStorage.getItem('city') == null && localStorage.getItem('province') == null && localStorage.getItem('searchtext') != "NULL" ){
        this.motels = this.motelsearch.filter(a => a.address.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()));
        this.totalRecord.emit(this.motels.length);
        console.log("searchtext")
      }
      //

      //2
      if(localStorage.getItem('city') && localStorage.getItem('province') == null && localStorage.getItem('searchtext') != "NULL" ){
        this.motels = this.motelsearch.filter(a => a.city.name == localStorage.getItem('city') && a.address.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()));
        this.totalRecord.emit(this.motels.length);
        console.log("city,searchtext")
      }

      if(localStorage.getItem('city') == null && localStorage.getItem('province') && localStorage.getItem('searchtext') != "NULL" ){
        this.motels = this.motelsearch.filter(a => a.province.name == localStorage.getItem('province') && a.address.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()));
        this.totalRecord.emit(this.motels.length);
        console.log("province,searchtext")
      }

      if(localStorage.getItem('city') && localStorage.getItem('province') && localStorage.getItem('searchtext') == "NULL" ){
        this.motels = this.motelsearch.filter(a => a.city.name == localStorage.getItem('city') &&  a.province.name == localStorage.getItem('province') );
        this.totalRecord.emit(this.motels.length);
        console.log("province,city")
      }

      //0
      if(localStorage.getItem('city') == null && localStorage.getItem('province') == null && localStorage.getItem('searchtext') == "NULL" ){
        this.motels = this.motelsearch;
        this.totalRecord.emit(this.motels.length);
      }

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

  
 
}
