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

  searchname;
  //load tên trên thanh tophead
  nametophead;
  name;
  
  searchtext;
  @Output() newTypeSearch: EventEmitter<string> = new EventEmitter<string>();
  constructor(private behaviorSubjectClass:BehaviorSubjectClass,private router: Router,public activerouter:ActivatedRoute,private motelService: MotelService,private cityService: CitiesService, private provinceService: ProvincesService, private typeservice:TypeofnewService) {
 
  }

  ngOnInit(): void {
    this.getCities();
    this.getNewTypes();
    this.city = "Toàn quốc";
    this.province = "Tất cả";
    this.newType = "Phòng trọ, nhà cho thuê"
    console.log(this.cities);

    if(localStorage.getItem('city'))
    {
      this.city = localStorage.getItem('city');
    }

    if(localStorage.getItem('province')){
      this.province = localStorage.getItem('province');
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

 
  public onChoiceCity = async (name) => {
    this.city = name;
    localStorage.removeItem('city');

    localStorage.setItem('city', name);
    this.getProvinces();
  }

  public onChoiceProvince = async (name) => {
    this.province = name;
    localStorage.removeItem('province');
    localStorage.setItem('province', name);
  }

  public onChoiceNewtype(name) {
    this.newType = name;
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

  public onClick() {
    localStorage.removeItem('searchtext');
    if(this.searchtext === undefined){
      localStorage.setItem('searchtext', "NULL");
    }
    else{
      localStorage.setItem('searchtext', this.searchtext);
    }
    console.log(localStorage.getItem('searchtext'))
    this.newTypeSearch.emit(this.newType);
    if(this.newType === "Phòng trọ, nhà trọ"){
      this.router.navigateByUrl('/home/cho-thue-nha-tro');
    }
    else if(this.newType === "Nhà thuê nguyên căn"){
      this.router.navigateByUrl('/home/nha-cho-thue');
    }
    else if(this.newType === "Cho thuê căn hộ"){
      this.router.navigateByUrl('/home/cho-thue-can-ho');
    }
    else if(this.newType === "Tìm người ở ghép"){
      this.router.navigateByUrl('/home/tim-nguoi-o-ghep-cap');
    }
    else if(this.newType === "Cho thuê mặt bằng"){
      this.router.navigateByUrl('/home/cho-thue-mat-bang');
    }
    else {
      this.router.navigateByUrl('/home/cho-thue-nha-tro');
    }
  }

}
