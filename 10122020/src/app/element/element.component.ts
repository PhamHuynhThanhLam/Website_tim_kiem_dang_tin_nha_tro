import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CitiesService } from '../../app/serviceapits/cities.service'
import { City } from '../model/City';
import { Typeofnew } from '../model/Typeofnew';
import { Province } from '../model/Province';
import { Motel } from '../model/Motel';
import { ProvincesService } from '../../app/serviceapits/provinces.service'
import { TypeofnewService } from '../../app/serviceapits/typeofnew.service'
import { DangtinService } from '../../app/serviceapits/dangtin.service'
import { Router } from '@angular/router';

@Component({
  selector: 'app-element',
  templateUrl: './element.component.html',
  styleUrls: ['./element.component.css']
})
export class ElementComponent implements OnInit {

  public cities = new Array<City>();
  public city;

  public provinces = new Array<Province>();
  public province;

  public types = new Array<Typeofnew>();
  public type;

  motels: Motel[];
  motelnews: Motel[];
  motelnewcar1s: Motel[];
  motelnewcar2s: Motel[];
  motelnewcar3s: Motel[];
  typeclick;
  searchname;

  constructor(private router: Router,private motelService: DangtinService,private cityService: CitiesService, private provinceService: ProvincesService, private typeservice:TypeofnewService) { }

  ngOnInit(){
    //await this.getCitys();
    this.getCitys();
    this.getHighlightsMotel();
    this.getNewsMotel();
    this.getTypes();
    this.city = "";
    this.typeclick = "Mua";
    console.log(this.cities);
  }

  clickbuy() {
    this.typeclick = "Mua"
  }

  clicksell() {
    this.typeclick = "Thuê"
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

  public getHighlightsMotel () {
    this.motelService.getHighlightsMotels().subscribe(gettypes => this.motels = gettypes)
    console.log(this.motels);
  }

  public getsearch () {
    let motel = new Motel();

    //motel.typeservice = this.typeclick;
    var cityfind = this.cities.find(m => m.name == this.city);
    //var provincefind = this.provinces.find(m => m.name == this.province);
    //var typefind = this.types.find(m => m.name == this.type);

    //motel.city = cityfind;
    //motel.province = provincefind;this.type
    //motel.detail.typeofnew = typefind;

    //motel.title = this.searchname;
    //motel.address = this.searchname;
    this.motelService.setSearchMotel(motel);    
    this.router.navigateByUrl('/home/cho-thue-nha-tro');
  }

  public getNewsMotel () {
    this.motelService.getNowsMotels().subscribe(gettypes => this.motelnews = gettypes)
    console.log(this.motelnews);
    for(let i=0; i< this.motelnews.length;i++){
      if(Number(i) < 4){
        this.motelnewcar1s.push(this.motelnews[i]);
      }
      if(Number(i) >= 4 && Number(i) < 8){
        this.motelnewcar2s.push(this.motelnews[i]);
      }
      if(Number(i) >= 8 && Number(i) < 12){
        this.motelnewcar2s.push(this.motelnews[i]);
      }
    }
  }
}
