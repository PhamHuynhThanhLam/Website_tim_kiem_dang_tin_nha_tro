import { Component, Input, OnInit } from '@angular/core';
import { CitiesService } from '../../serviceapits/cities.service'
import { City } from '../../model/City';
import { Typeofnew } from '../../model/Typeofnew';
import { Province } from '../../model/Province';
import { Motel } from '../../model/Motel';
import { ProvincesService } from '../../serviceapits/provinces.service'
import { TypeofnewService } from '../../serviceapits/typeofnew.service'
import { DangtinService } from '../../serviceapits/dangtin.service'
import { Router,ActivatedRoute } from '@angular/router';
import { Detail } from 'src/app/model/Detail';

@Component({
  selector: 'app-barsearchandbar',
  templateUrl: './barsearchandbar.component.html',
  styleUrls: ['./barsearchandbar.component.css']
})
export class BarsearchandbarComponent implements OnInit {

  public cities = new Array<City>();
  public city;

  public provinces = new Array<Province>();
  public province;

  public types = new Array<Typeofnew>();
  public type;
  searchname;
  NAME;
  name;

  constructor(private router: Router,public activerouter:ActivatedRoute,private motelService: DangtinService,private cityService: CitiesService, private provinceService: ProvincesService, private typeservice:TypeofnewService) { }


  ngOnInit(): void {
    this.getCitys();
    this.getTypes();
    this.city = "";
    console.log(this.cities);


    this.activerouter.data.subscribe(data => {
      this.name = data.kind;
    })
    console.log(this.name);
    if(this.name == "cho-thue-nha-tro"){
      this.NAME = "Cho thuê phòng trọ, nhà trọ số 1 Việt Nam";
    }
    if(this.name == "nha-cho-thue"){
      this.NAME = "Cho Thuê Nhà Nguyên Căn, Giá Rẻ, Chính Chủ, Mới Nhất 2020";
    }
    if(this.name == "cho-thue-can-ho"){
      this.NAME = "Cho Thuê Căn Hộ Chung Cư Mini, Căn Hộ Dịch Vụ, Giá Rẻ - Mới Nhất 2020";
    }
    if(this.name == "cho-thue-mat-bang"){
      this.NAME = "Cho Thuê Mặt Bằng, Cho Thuê Văn Phòng, Cửa Hàng, Kiot";
    }
    if(this.name == "tim-nguoi-o-ghep"){
      this.NAME = "Tìm Người Ở Ghép, Tìm Nam Ở Ghép, Tìm Nữ Ở Ghép";
    }
  }

  public getsearch () {
    let motel = new Motel();

    if(this.city != ""){
      var cityfind = this.cities.find(m => m.name == this.city);
      motel.city = cityfind;
    }
    if(this.province != ""){
      var provincefind = this.provinces.find(m => m.name == this.province);
      motel.province = provincefind;
    }
    if(this.type != ""){
      this.type == "Phòng trọ, nhà trọ"
      let detail = new Detail();
      var typefind = this.types.find(m => m.name == this.type);
      detail.typeofnew = typefind
      motel.detail = detail;
    }
    if(this.searchname != ""){
      motel.title = this.searchname;
      motel.address = this.searchname;
    }

    this.motelService.setSearchMotel(motel);
  }

  public clickcity = async (name) => {
    this.city = name;
    this.onprovince();
  }

  public clickprovince = async (name) => {
    this.province = name;
  }

  public clicktype = async (name) => {
    this.type = name;
  }

  public onprovince(){
    if(this.city == ""){
      alert("Chọn thành phố trước");
    }
    else{
        var id = this.cities.find(m => m.name == this.city);
        console.log(id)
        this.provinceService.getProvincesByCity(Number(id.id)).subscribe( data => this.provinces = data)
    }
  }

  public getCitys(){
    this.cityService.getCitys().subscribe(getcity => this.cities = getcity)
  }


  public getTypes(){
    this.typeservice.getTypes().subscribe(gettypes => this.types = gettypes)
  }


}
