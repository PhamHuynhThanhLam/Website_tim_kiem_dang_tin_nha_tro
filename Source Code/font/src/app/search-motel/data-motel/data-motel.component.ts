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
import { DialogSearchMotelComponent } from '../dialog-search-motel/dialog-search-motel.component';
import { AreaSearchService } from 'src/app/services/area-search.service';
import { AreaSearch } from 'src/app/model/AreaSearch';

export interface Type{
  id:number;
  text:string;
}

declare var jQuery: any;

@Component({
  selector: 'app-data-motel',
  templateUrl: './data-motel.component.html',
  styleUrls: ['./data-motel.component.css']
})
export class DataMotelComponent implements OnInit {

  public news:Array<Type> = [
    {id: 0, text:'Tin Hot'}, // 4 tuần, 2 tuần
    {id: 1, text:'Tin VIP 3'}, // 
    {id: 2, text:'Tin VIP 2'},
    {id: 3, text:'Tin VIP 1'},
    {id: 4, text:'Tin thường'},
  ];

  motelsearch: Motel[] = [];
  motels:Motel[];
  motelLoc:Motel[];

  types: NewType[];
  counttypes: NewType[]; // mảng các loại nhà trọ
  arraycounttype: number[] =[]; // đếm số loại nhà trọ
  name:string;

  //Phân trang tổng số trang
  totalRecord;
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
  area: AreaSearch[];
  

  @Input() newTypeseach;
  @Input() citySearch;

  filterSearch;
  constructor(private areaSearchService:AreaSearchService,private behaviorSubjectClass:BehaviorSubjectClass,private userService:UserService,private authenticationService: AuthenticationService,public dialog: MatDialog,private typeservice:TypeofnewService,private route: Router,private router: ActivatedRoute,private motelService:MotelService) {
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    this.getDataAreaZone();
    (function ($) {
      $(document).ready(function myFunction(){
        var myVar;
        myVar = setTimeout(showPage, 2000);
      });

      function showPage() {
        document.getElementById("loader").style.display = "none";
        document.getElementById("myDiv").style.display = "block";
      }
      
    })(jQuery);
   }


   async ngOnInit(): Promise<void> {
    this.getTypes();
    this.isUser();
    this.router.data.subscribe(data => {
      this.name = data.kind;
    })

    if(this.name == "cho-thue-nha-tro"){
      this.nametophead = "Cho thuê phòng trọ, nhà trọ số 1 Việt Nam";
       await this.getMotelByType("Phòng trọ, nhà trọ");
       console.log("aa")
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

  public getMotelDeffault(){
    this.motels = this.motelsearch
    this.seach = "Mặc định"
  }

  public getDataAreaZone(){
    this.areaSearchService.getAreaSearch().subscribe(getareasaerch => {
      this.area = getareasaerch;
    });
  }

  public linkRouter(name, id) {
    console.log(name + id);
    //this.router.navigate( [{name: name, id: id}]);
    this.route.navigate( ['/home/chi-tiet',name,id]);
  }

  public handlePageChange(event) {
    this.page = event;
  }

  public loadDataHot(motel){
    for(let i = 0; i< motel.length; i++){
      if(motel[i].typeservice == "Tin Hot")
      {
        this.motelsearch.push(motel[i])
      }
    }
  }

  public loadData3(motel){
    for(let i = 0; i< motel.length; i++){
      if(motel[i].typeservice == "Tin VIP 3")
      {
        this.motelsearch.push(motel[i])
      }
    }
  }

  public loadData2(motel){
    for(let i = 0; i< motel.length; i++){
      if(motel[i].typeservice == "Tin VIP 2")
      {
        this.motelsearch.push(motel[i])
      }
    }
  }

  public loadData1(motel){
    for(let i = 0; i< motel.length; i++){
      if(motel[i].typeservice == "Tin VIP 1")
      {
        this.motelsearch.push(motel[i])
      }
    }
  }

  public loadDataThuong(motel){
    for(let i = 0; i< motel.length; i++){
      if(motel[i].typeservice == "Tin thường")
      {
        this.motelsearch.push(motel[i])
      }
    }
  }


  public getMotelByType(name) {
    this.motelService.getmotelbytype(name).subscribe(motel => {

      this.loadDataHot(motel);
      this.loadData1(motel);
      this.loadData2(motel);
      this.loadData3(motel);    
      this.loadDataThuong(motel);
      console.log(motel)
      this.getMotelByCity(this.motelsearch);

      this.getMotelByProvince(this.motels);

      this.getMotelByDistrict(this.motels)
      this.getMotelByStreet(this.motels)
      this.getMotelBySearch(this.motels);

      this.getMotelByPriceSearch(localStorage.getItem('priceid'),this.motels)
      this.motelLoc = this.motels;       
      this.totalRecord =this.motels.length;  
      
      /*
      //4
      if((localStorage.getItem('priceid') && localStorage.getItem('priceid') != "Tất cả") && (localStorage.getItem('city') && localStorage.getItem('city') != "Tất cả") &&  localStorage.getItem('searchtext') != "NULL" && (localStorage.getItem('province') && localStorage.getItem('province') != "Tất cả") ){
        this.getMotelByCity(this.motelsearch);
        this.getMotelByProvince(this.motels);
        this.motels = this.motels.filter(a => a.title.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()))
        this.getMotelByPriceSearch(localStorage.getItem('priceid'),this.motels)
        this.motelLoc = this.motels;       
        this.totalRecord =this.motels.length;       
        console.log("province,city,searchtext,priceid")
      }

      //1
      if((localStorage.getItem('city') && localStorage.getItem('city') != "Tất cả") && (localStorage.getItem('province') == null || localStorage.getItem('province') == "Tất cả") && localStorage.getItem('searchtext') === "NULL"  && (localStorage.getItem('priceid') == null || localStorage.getItem('priceid') == "Tất cả")){
        this.getMotelByCity(this.motelsearch);
        this.motelLoc = this.motels;
        this.totalRecord =this.motels.length;
        console.log("city")

      }

      if((localStorage.getItem('province') && localStorage.getItem('province') != "Tất cả") && (localStorage.getItem('city') == null || localStorage.getItem('city') == "Tất cả") && localStorage.getItem('searchtext') == "NULL" && (localStorage.getItem('priceid') == null || localStorage.getItem('priceid') == "Tất cả")){
        this.motels = this.motelsearch.filter(a => a.province.name == localStorage.getItem('province'))
        this.motelLoc = this.motels;
        this.totalRecord =this.motels.length;
        console.log("province")
      }

      if((localStorage.getItem('province') == null || localStorage.getItem('province') == "Tất cả") && (localStorage.getItem('city') == null || localStorage.getItem('city') == "Tất cả") && localStorage.getItem('searchtext') == "NULL" && (localStorage.getItem('priceid') && localStorage.getItem('priceid') != "Tất cả")){
        this.getMotelByPriceSearch(localStorage.getItem('priceid'),this.motelsearch)
        this.motelLoc = this.motels;
        console.log("priceid")
        this.totalRecord =this.motels.length;
      }

      console.log(localStorage.getItem('province'))
      if((localStorage.getItem('searchtext') != "NULL" && localStorage.getItem('searchtext') != null) && (localStorage.getItem('city') == null || localStorage.getItem('city') == "Tất cả") && (localStorage.getItem('province') == null || localStorage.getItem('province') == "Tất cả")  && (localStorage.getItem('priceid') == null || localStorage.getItem('priceid') == "Tất cả")){
        this.motels = this.motelsearch.filter(a => a.title.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()));
        this.motelLoc = this.motels;
        this.totalRecord =this.motels.length;
        console.log("searchtext")
      }
      //

      //2
      if((localStorage.getItem('city') && localStorage.getItem('city') != "Tất cả") && (localStorage.getItem('province') == null || localStorage.getItem('province') == "Tất cả") && localStorage.getItem('searchtext') != "NULL" && (localStorage.getItem('priceid') == null || localStorage.getItem('priceid') == "Tất cả")){
        this.getMotelByCity(this.motelsearch);
        this.motels = this.motels.filter(a => a.title.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()));
        this.motelLoc = this.motels;
        this.totalRecord =this.motels.length;
        console.log("city,searchtext")
      }

      if((localStorage.getItem('city') && localStorage.getItem('city') != "Tất cả") && (localStorage.getItem('province') && localStorage.getItem('province') != "Tất cả") && localStorage.getItem('searchtext') == "NULL" && (localStorage.getItem('priceid') == null || localStorage.getItem('priceid') == "Tất cả")){
        this.getMotelByCity(this.motelsearch);
        this.getMotelByProvince(this.motels);
        this.motelLoc = this.motels;
        this.totalRecord =this.motels.length;
        console.log("province,city")
      }

      if((localStorage.getItem('city') && localStorage.getItem('city') != "Tất cả") && (localStorage.getItem('province') == null || localStorage.getItem('province') == "Tất cả") && localStorage.getItem('searchtext') == "NULL" && (localStorage.getItem('priceid') && localStorage.getItem('priceid') != "Tất cả")){
        
        this.getMotelByCity(this.motelsearch);
        this.getMotelByPriceSearch(localStorage.getItem('priceid'),this.motels)
        this.motelLoc = this.motels;    
        this.totalRecord =this.motels.length;   
        console.log("priceid,city")
      }

      if((localStorage.getItem('city') == null || localStorage.getItem('city') == "Tất cả") && (localStorage.getItem('province') && localStorage.getItem('province') !="Tất cả") && localStorage.getItem('searchtext') != "NULL" && (localStorage.getItem('priceid') == null || localStorage.getItem('priceid') == "Tất cả")){
        this.getMotelByProvince(this.motelsearch);
        this.motels = this.motels.filter(a => a.title.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()));
        this.motelLoc = this.motels;
        this.totalRecord =this.motels.length;
        console.log("province,searchtext")
      }

      if((localStorage.getItem('city') == null || localStorage.getItem('city') == "Tất cả") && (localStorage.getItem('province') && localStorage.getItem('province') !="Tất cả") && localStorage.getItem('searchtext') == "NULL" && (localStorage.getItem('priceid') && localStorage.getItem('priceid') != "Tất cả")){
        this.getMotelByProvince(this.motelsearch);
        this.getMotelByPriceSearch(localStorage.getItem('priceid'),this.motels)
        this.motelLoc = this.motels;
        this.totalRecord =this.motels.length;
        console.log("province,priceid")
      }
      

      if((localStorage.getItem('city') == null || localStorage.getItem('city') == "Tất cả") && (localStorage.getItem('province') == null || localStorage.getItem('province') == "Tất cả") && localStorage.getItem('searchtext') != "NULL" && (localStorage.getItem('priceid') && localStorage.getItem('priceid') != "Tất cả")){
        this.motels = this.motelsearch.filter(a => a.title.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()));
        this.getMotelByPriceSearch(localStorage.getItem('priceid'),this.motels)
        this.motelLoc = this.motels;
        this.totalRecord = this.motels.length;
        console.log("searchtext,priceid")
      }
      //

      //3
      if((localStorage.getItem('city') && localStorage.getItem('city') != "Tất cả") && (localStorage.getItem('province') && localStorage.getItem('province') != "Tất cả") && localStorage.getItem('searchtext') != "NULL" && (localStorage.getItem('priceid') == null && localStorage.getItem('priceid') == "Tất cả")){
        this.getMotelByCity(this.motelsearch);
        this.getMotelByProvince(this.motels);
        this.motels = this.motels.filter(a => a.title.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()));
        this.motelLoc = this.motels;
        this.totalRecord = this.motels.length;
        console.log("city,province,searchtext")
      }
      if((localStorage.getItem('city') && localStorage.getItem('city') != "Tất cả") && (localStorage.getItem('province') && localStorage.getItem('province') != "Tất cả") && localStorage.getItem('searchtext') == "NULL" && (localStorage.getItem('priceid') && localStorage.getItem('priceid') != "Tất cả") ){
        this.getMotelByCity(this.motelsearch);
        this.getMotelByProvince(this.motels);
        this.getMotelByPriceSearch(localStorage.getItem('priceid'),this.motels)
        this.motelLoc = this.motels;
        this.totalRecord =this.motels.length;
        console.log("city,province,priceid")
      }
      if((localStorage.getItem('city') == null && localStorage.getItem('city') == "Tất cả") && (localStorage.getItem('province') && localStorage.getItem('province') != "Tất cả") && localStorage.getItem('searchtext') != "NULL" && (localStorage.getItem('priceid') && localStorage.getItem('priceid') != "Tất cả") ){
        this.getMotelByProvince(this.motels);
        this.motels = this.motels.filter(a => a.title.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()));       
        this.getMotelByPriceSearch(localStorage.getItem('priceid'),this.motels)
        this.motelLoc = this.motels;
        this.totalRecord = this.motels.length;
        console.log("searchtext,province,priceid")
      }
      if((localStorage.getItem('city') && localStorage.getItem('city') != "Tất cả")  && (localStorage.getItem('province') == null || localStorage.getItem('province') == "Tất cả") && localStorage.getItem('searchtext') != "NULL" && (localStorage.getItem('priceid') && localStorage.getItem('priceid') != "Tất cả") ){
        this.getMotelByCity(this.motelsearch);
        this.motels = this.motels.filter(a => a.title.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()));       
        this.getMotelByPriceSearch(localStorage.getItem('priceid'),this.motels)
        this.motelLoc = this.motels;
        this.totalRecord = this.motels.length;
        console.log("searchtext,city,priceid")
      }

      //0
      if((localStorage.getItem('priceid') == null && localStorage.getItem('city') == null && localStorage.getItem('province') == null && (localStorage.getItem('searchtext') == "NULL" ||localStorage.getItem('searchtext') == null) ) || (localStorage.getItem('priceid') == "Tất cả"  && localStorage.getItem('city') == "Tất cả"  && localStorage.getItem('province') == "Tất cả" && (localStorage.getItem('searchtext') == "NULL" ||localStorage.getItem('searchtext') == null) )){
        this.motels = this.motelsearch;
        this.motelLoc = this.motels;
        this.totalRecord = this.motels.length;
      }

      else{

      }*/
     
    });
  }

  public isUser() {
    try{
      var role = Number(this.currentAccount.roleId);
    }
    catch(error){    
      if(role == 1){
        this.xetvalue = true;
      }
      this.xetvalue = false;
    }
    
  }

  public openDialog(): void {
    const dialogRef = this.dialog.open(DialogSearchMotelComponent, {
      direction: "ltr",
      width: '400px'
    });

    dialogRef.afterClosed().subscribe(() => {
      try{

      }
      catch(error){
        console.log("errr")
      }
    
      //1
      if(localStorage.getItem('areaName') == null && localStorage.getItem('directName') ){
       this.motels = this.motelLoc.filter(a => a.detail.director == localStorage.getItem('directName'))
       this.totalRecord = this.motels.length;
       console.log("directName")
      }
      if(localStorage.getItem('areaName') && localStorage.getItem('directName') == null ){
        var area = this.area.find(a => a.name == localStorage.getItem('areaName'))
        this.getMotelByAreaSearch(area.id);
        console.log("areaName")
      }
       
      if(localStorage.getItem('areaName') && localStorage.getItem('directName')){
        var area = this.area.find(a => a.name == localStorage.getItem('areaName'))
        this.getMotelByAreaSearch(area.id);
        this.motels = this.motelLoc.filter(a => a.detail.director == localStorage.getItem('directName'))
        this.totalRecord = this.motels.length;
        console.log("areaName,directName")
      }


      //0
      if(localStorage.getItem('areaName') == null && localStorage.getItem('directName') == null){
        this.motels = this.motelsearch;
        this.motelLoc = this.motels;
        this.totalRecord = this.motels.length;
        console.log("_________")
      }

    });
  }

  public getMotelByAreaSearch(id){
    if(Number(id) == 1){
      this.motels = this.motelLoc.filter(a => Number(a.areaZone) < 20)
      this.totalRecord = this.motels.length;
    }
    else if(Number(id) == 2){
      this.motels = this.motelLoc.filter(a => Number(a.areaZone) >= 20 && Number(a.areaZone) < 30)
      this.totalRecord = this.motels.length;
    }
    else if(Number(id) == 3){
      this.motels = this.motelLoc.filter(a => Number(a.areaZone) >= 30 && Number(a.areaZone) < 50)
      this.totalRecord = this.motels.length;
    }
    else if(Number(id) == 4){
      this.motels = this.motelLoc.filter(a => Number(a.areaZone) >= 50 && Number(a.areaZone) < 60)
      this.totalRecord = this.motels.length;
    }
    else if(Number(id) == 5){
      this.motels = this.motelLoc.filter(a => Number(a.areaZone) >= 60 && Number(a.areaZone) < 70)
      this.totalRecord = this.motels.length;
    }
    else if(Number(id) == 6){
      this.motels = this.motelLoc.filter(a => Number(a.areaZone) >= 70 && Number(a.areaZone) < 80)
      this.totalRecord = this.motels.length;
    }
    else if(Number(id) == 7){
      this.motels = this.motelLoc.filter(a => Number(a.areaZone) >= 80 && Number(a.areaZone) < 90)
      this.totalRecord = this.motels.length;
    }
    else if(Number(id) == 8){
      this.motels = this.motelLoc.filter(a => Number(a.areaZone) >= 90 && Number(a.areaZone) < 100)
      this.totalRecord = this.motels.length;
    }
    else if(Number(id) == 9){
      this.motels = this.motelLoc.filter(a => Number(a.areaZone) > 100)
      this.totalRecord = this.motels.length;
    }
  }

  public getMotelByCity(motelss){
    if((localStorage.getItem('city') && localStorage.getItem('city') != "0")){
      this.motels = motelss.filter(a => a.cityId == localStorage.getItem('city'))
    }
    else{
      this.motels = this.motelsearch;
    }
    
  }

  public getMotelByProvince(motelss){
    if((localStorage.getItem('province') && localStorage.getItem('province') != "0")){
      this.motels = motelss.filter(a => a.provinceId == localStorage.getItem('province'))
    }
    else{
      
    }
  }

  public getMotelByDistrict(motelss){
    if((localStorage.getItem('district') && localStorage.getItem('district') != "0")){
      this.motels = motelss.filter(a => a.districtId == localStorage.getItem('district'))
    }
    else{
      
    }
  }

  public getMotelByStreet(motelss){
    if((localStorage.getItem('street') && localStorage.getItem('street') != "0")){
      this.motels = motelss.filter(a => a.streetId == localStorage.getItem('street'))
    }
    else{
      
    }
  }

  public getMotelBySearch(motelss){
    if(localStorage.getItem('searchtext') != "NULL" && localStorage.getItem('searchtext') != null){
      this.motels = this.motels.filter(a => a.title.toLowerCase().includes(localStorage.getItem('searchtext').toLowerCase()));
    }
    else{
      
    }

  }

  public getMotelByPriceSearch(id,motelss){
    if(Number(id) == 1){
      this.motels = motelss.filter(a => (Number(a.price) < 1.000 && a.priceType == "triệu/tháng") || (Number(a.price) < 999 && a.priceType == "đồng/tháng"))
      this.totalRecord = this.motels.length;
      console.log("1")
    }
    else if(Number(id) == 2){
      this.motels = motelss.filter(a => Number(a.price) >= 1.000 && Number(a.price) < 2.000 && a.priceType == "triệu/tháng")
      this.totalRecord = this.motels.length;
      console.log("2")
    }
    else if(Number(id) == 3){
      this.motels = motelss.filter(a => Number(a.price) >= 2.000 && Number(a.price) < 3.000 && a.priceType == "triệu/tháng")
      this.totalRecord = this.motels.length;
      console.log("3")
    }
    else if(Number(id) == 4){
      this.motels = motelss.filter(a => Number(a.price) >= 3.000 && Number(a.price) < 5.000 && a.priceType == "triệu/tháng")
      this.totalRecord = this.motels.length;
      console.log("4")
    }
    else if(Number(id) == 5){
      this.motels = motelss.filter(a => Number(a.price) >= 5.000 && Number(a.price) < 7.000 && a.priceType == "triệu/tháng")
      this.totalRecord = this.motels.length;
      console.log("5")
    }
    else if(Number(id) == 6){
      this.motels = motelss.filter(a => Number(a.price) >= 7.000 && Number(a.price) < 10.000 && a.priceType == "triệu/tháng")
      this.totalRecord = this.motels.length;
      console.log("6")
    }
    else if(Number(id) == 7){
      this.motels = motelss.filter(a => Number(a.price) >= 10.000 && Number(a.price) < 15.000 && a.priceType == "triệu/tháng")
      this.totalRecord = this.motels.length;
      console.log("7")
    }
    else if(Number(id) == 8){
      this.motels = motelss.filter(a => Number(a.price) > 15.000 && a.priceType == "triệu/tháng")
      this.totalRecord = this.motels.length;
      console.log("8")
    }
  }
 
}
