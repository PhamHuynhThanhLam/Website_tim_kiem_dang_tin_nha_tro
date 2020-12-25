import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
import { CitiesService } from '../../services/cities.service'
import { City } from '../../model/City';
import { NewType } from '../../model/NewType';
import { Province } from '../../model/Province';
import { Motel } from '../../model/Motel';
import { ProvincesService } from '../../services/provinces.service'
import { BehaviorSubjectClass } from '../../services/behaviorsubject'
import { TypeofnewService } from '../../services/newstype.service'
import { MotelService } from '../../services/motel.service'
import { Router,ActivatedRoute } from '@angular/router';
import { Detail } from 'src/app/model/Detail';
import { PriceSearch } from 'src/app/model/PriceSearch';
import { PriceSearchService } from 'src/app/services/price-search.service';
import { Location, PopStateEvent } from '@angular/common';

@Component({
  selector: 'app-barsearchandbar',
  templateUrl: './barsearchandbar.component.html',
  styleUrls: ['./barsearchandbar.component.css']
})
export class BarsearchandbarComponent implements OnInit {

  // Danh sách city và tên city
  cities = new Array<City>();
  city;
  // Danh sách province và tên province
  provinces = new Array<Province>();
  province;
  // Danh sách province và tên province
  newTypes = new Array<NewType>();
  newType;
  // Danh sách pricesearch và tên pricesearch
  priceSearchs: PriceSearch [];
  priceSearch;
  
  searchname;
  //load tên trên thanh tophead
  nametophead;
  name;
  
  searchtext;
  @Output() newTypeSearch: EventEmitter<string> = new EventEmitter<string>();
  constructor(public location: Location,private priceSearchServer:PriceSearchService,private behaviorSubjectClass:BehaviorSubjectClass,private router: Router,public activerouter:ActivatedRoute,private motelService: MotelService,private cityService: CitiesService, private provinceService: ProvincesService, private typeservice:TypeofnewService) {
 
  }

  ngOnInit(): void {
    this.getPrices();
    this.getCities();
    this.getNewTypes();
    this.city = "Toàn quốc";
    this.province = "Tất cả";
    this.newType = "Phòng trọ, nhà cho thuê"
    this.priceSearch = "Giá thuê"

    if(localStorage.getItem('city'))
    {
      this.city = localStorage.getItem('city');
    }

    if(localStorage.getItem('province')){
      this.province = localStorage.getItem('province');
    }

    if(Number(localStorage.getItem('priceid')) == 1){
      this.priceSearch = "Dưới 1 triệu";
    }
    if(Number(localStorage.getItem('priceid')) == 2){
      this.priceSearch = "1 triệu - 2 triệu";
    }
    if(Number(localStorage.getItem('priceid')) == 3){
      this.priceSearch = "2 triệu - 3 triệu";
    }
    if(Number(localStorage.getItem('priceid')) == 4){
      this.priceSearch = "3 triệu - 5 triệu";
    }
    if(Number(localStorage.getItem('priceid')) == 5){
      this.priceSearch = "5 triệu - 7 triệu";
    }
    if(Number(localStorage.getItem('priceid')) == 6){
      this.priceSearch = "7 triệu - 10 triệu";
    }
    if(Number(localStorage.getItem('priceid')) == 7){
      this.priceSearch = "7 triệu - 10 triệu";
    }
    if(Number(localStorage.getItem('priceid')) == 8){
      this.priceSearch = "10 triệu - 15 triệu";
    }
    
    this.activerouter.data.subscribe(data => {
      this.name = data.kind;
    })
    console.log(this.name);
    if(this.name == "cho-thue-nha-tro"){
      this.nametophead = "Cho thuê phòng trọ, nhà trọ số 1 Việt Nam";
      this.newType = "Phòng trọ, nhà trọ"
    }
    if(this.name == "nha-cho-thue"){
      this.nametophead = "Cho Thuê Nhà Nguyên Căn, Giá Rẻ, Chính Chủ, Mới Nhất 2020";
      this.newType = "Nhà thuê nguyên căn"

    }
    if(this.name == "cho-thue-can-ho"){
      this.nametophead = "Cho Thuê Căn Hộ Chung Cư Mini, Căn Hộ Dịch Vụ, Giá Rẻ - Mới Nhất 2020";
      this.newType = "Cho thuê căn hộ"

    }
    if(this.name == "cho-thue-mat-bang"){
      this.nametophead = "Cho Thuê Mặt Bằng, Cho Thuê Văn Phòng, Cửa Hàng, Kiot";

      this.newType = "Cho thuê mặt bằng"
    }
    if(this.name == "tim-nguoi-o-ghep-cap"){
      this.nametophead = "Tìm Người Ở Ghép, Tìm Nam Ở Ghép, Tìm Nữ Ở Ghép";
      this.newType = "Tìm người ở ghép"
    }
  }

 
  public onChoiceCity(name) {
    this.city = name;
    localStorage.removeItem('city');

    localStorage.setItem('city', name);
    this.getProvinces();
  }

  public onChoiceProvince(name) {
    this.province = name;
    localStorage.removeItem('province');
    localStorage.setItem('province', name);
  }

  public onChoiceNewtype(name) {
    this.newType = name;
  }

  public onChoicePriceSearch(price) {
    this.priceSearch = price.number;
    localStorage.removeItem('priceid');
    localStorage.setItem('priceid', price.id);
  }
  
  public getProvinces(){
    if(this.city == ""){
      alert("Chọn thành phố trước");
    }
    else{
        var id = this.cities.find(m => m.name == this.city);
        console.log(id)
        this.provinceService.getProvincesByCity(Number(id.id)).subscribe( data => this.provinces = data)
    }
  }

  public getCities(){
    this.cityService.getCitys().subscribe(getcity => this.cities = getcity)
  }


  public getNewTypes(){
    this.typeservice.getTypes().subscribe(gettypes => this.newTypes = gettypes)
  }

  public getPrices(){
    this.priceSearchServer.getprices().subscribe(getprice =>{
      this.priceSearchs = getprice
    })
    
  }

  public onClick() {
    localStorage.removeItem('searchtext');
    if(this.searchtext === undefined){
      localStorage.setItem('searchtext', "NULL");
    }
    else{
      localStorage.setItem('searchtext', this.searchtext);
    }

    this.newTypeSearch.emit(this.newType);
    if(this.newType === "Phòng trọ, nhà trọ"){
      window.location.reload();
      this.router.navigateByUrl('/home/cho-thue-nha-tro');
    }
    else if(this.newType === "Nhà thuê nguyên căn"){
      window.location.reload();
      this.router.navigateByUrl('/home/nha-cho-thue');
    }
    else if(this.newType === "Cho thuê căn hộ"){
      window.location.reload();
      this.router.navigateByUrl('/home/cho-thue-can-ho');
    }
    else if(this.newType === "Tìm người ở ghép"){
      window.location.reload();
      this.router.navigateByUrl('/home/tim-nguoi-o-ghep-cap');
    }
    else if(this.newType === "Cho thuê mặt bằng"){
      window.location.reload();
      this.router.navigateByUrl('/home/cho-thue-mat-bang');
    }
    else {
      window.location.reload();
      this.router.navigateByUrl('/home/cho-thue-nha-tro');
    }
  }

}
