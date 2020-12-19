import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { CitiesService } from '../../app/serviceapits/cities.service'
import { City } from '../model/City';
import { Typeofnew } from '../model/Typeofnew';
import { Province } from '../model/Province';
import { Motel } from '../model/Motel';
import { ProvincesService } from '../../app/serviceapits/provinces.service'
import { TypeofnewService } from '../../app/serviceapits/typeofnew.service'
import { DangtinService } from '../../app/serviceapits/dangtin.service'
import { PriceService } from '../../app/serviceapits/price.service'
import { Router } from '@angular/router';
import { Detail } from '../model/Detail';
import { Email } from '../model/Email';
import { Price } from '../model/Price';
import { HttpClient, HttpHeaders } from '@angular/common/http';

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

  typeclick;
  searchname;

  public name: string;
  public subject: string;
  public text: string;
  public email: string;
  emailsend:Email;


  public prices = new Array<Price>();
  public price;

  constructor(private priceServer:PriceService,private http: HttpClient,private router: Router,private motelService: DangtinService,private cityService: CitiesService, private provinceService: ProvincesService, private typeservice:TypeofnewService) { }

  ngOnInit(){
    //await this.getCitys();
    this.getPrices();
    this.getTypes();
    this.getCitys();
    
    this.getHighlightsMotel();
    this.getNewsMotel();

    this.city = "";
    this.province = "";
    this.price = "";
    this.typeclick = "Mua";
    console.log(this.cities);
  }

  sendEmail() {
    let email = new Email();
    email.name = this.name;
    email.subject = this.subject;
    email.text = this.text;
    console.log(email);
    this.motelService.postEmail(email).subscribe(email => this.emailsend == email);
  }

  linkrouter(name, id) {
    console.log(name + id);
    //this.router.navigate( [{name: name, id: id}]);
    this.router.navigate( ['/home/chitiet',name,id]);
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

  public clickprice = async (name) => {
    this.price = name;
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

  public getPrices(){
    this.priceServer.getprices().subscribe(getprice =>{
      this.prices = getprice
      console.log(this.prices);
    })
    
  }

  public getTypes(){
    this.typeservice.getTypes().subscribe(gettypes => {
      this.types = gettypes;
      console.log(this.types);
    })

  }

  public getHighlightsMotel () {
    this.motelService.getHighlightsMotels().subscribe(gettypes => this.motels = gettypes)
    console.log(this.motels);
  }

  public getsearch () {
    let motel = new Motel();

    motel.typeservice = this.typeclick;
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

    this.routertype();
  }

  public routertype(){
    if(this.type == "Phòng trọ, nhà trọ"){
      this.router.navigateByUrl('/home/cho-thue-nha-tro');
    }
    if(this.type == "Nhà thuê nguyên căn"){
      this.router.navigateByUrl('/home/nha-thue-nguyen-can');
    }
    if(this.type == "Cho thuê căn hộ"){
      this.router.navigateByUrl('/home/cho-thue-can-ho');
    }
    if(this.type == "Tìm người ở ghép"){
      this.router.navigateByUrl('/home/tim-nguoi-o-ghep');
    }
    if(this.type == "Cho thuê mặt bằng"){
      this.router.navigateByUrl('/home/cho-thue-mat-bang');
    }
    else {
      this.router.navigateByUrl('/home/cho-thue-nha-tro');
    }
  }

  public getNewsMotel () {
    this.motelService.getNowsMotels().subscribe(gettypes => {
      this.motelnews = gettypes;
      console.log(this.motelnews)
    });

  }
}
