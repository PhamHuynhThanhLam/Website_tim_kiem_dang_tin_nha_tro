import { Input } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Province } from '../../model/Province';
import { City } from '../../model/City';
import { CitiesService } from '../../serviceapits/cities.service'
import { ProvincesService } from '../../serviceapits/provinces.service'
import { Router } from '@angular/router';
import { DangtinService } from '../../serviceapits/dangtin.service';
import { Motel } from '../../model/Motel';

@Component({
  selector: 'app-thong-tin-co-ban',
  templateUrl: './thong-tin-co-ban.component.html',
  styleUrls: ['./thong-tin-co-ban.component.css']
})
export class ThongTinCoBanComponent implements OnInit {

  public name: string;
  public typemotel: string;
  public address: string;

  public cities = new Array<City>();
  public city: City;

  public provinces = new Array<Province>();
  public province: Province;

  constructor(private router: Router,private cityService: CitiesService, private provinceService: ProvincesService,public data:DangtinService) { }

  ngOnInit(): void {
    this.getCitys();
    this.typemotel = "Mua";
  }

  clickbuy() {
    this.typemotel = "Mua"
  }

  clicksell() {
    this.typemotel = "Thuê"
  }

  onChange(event)
  {
    let value = event.target.value;
    var id = this.cities.find(m => m.id == value);
    this.city = id;
    this.onprovince(value);
  }

  onChange2(event)
  {
    let value = event.target.value;
    var id = this.provinces.find(m => m.id == value);
    this.province = id;
  }

  public onprovince = async (ID) => {
    var id = this.cities.find(m => m.id == ID);
        console.log(id)
        const list = this.provinceService.getProvincesByCity(Number(id.id)).subscribe((data) => {
          for (let i = 0; i < data.length; i++) {
            let province = new Province();
            province.id = data[i].id;
            province.name = data[i].name;
            this.provinces.push(province);
          }
      })
  }

  public getCitys = async () => {
    this.cityService.getCitys().subscribe(getcity => this.cities = getcity)
  }

  next(){
    let motel = new Motel(); 
    motel.name = this.name;
    motel.typemotel = this.typemotel;
    motel.cityid = this.city.id;
    motel.provinceid = this.province.id;
    motel.address = this.address;
    this.data.setdatamotel(motel);
    console.log("aaaaa");
    this.router.navigateByUrl('/user/thongtin2');
  }
}
