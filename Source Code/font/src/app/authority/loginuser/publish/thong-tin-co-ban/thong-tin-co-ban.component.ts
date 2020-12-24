import { Input } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Province } from '../../../../model/Province';
import { City } from '../../../../model/City';
import { CitiesService } from '../../../../services/cities.service'
import { ProvincesService } from '../../../../services/provinces.service'
import { Router } from '@angular/router';
import { MotelService } from '../../../../services/motel.service';
import { Motel } from '../../../../model/Motel';
import { BehaviorSubjectClass } from '../../../../services/behaviorsubject'

@Component({
  selector: 'app-thong-tin-co-ban',
  templateUrl: './thong-tin-co-ban.component.html',
  styleUrls: ['./thong-tin-co-ban.component.css']
})
export class ThongTinCoBanComponent implements OnInit {

  nameMotel: string;
  typeMotel: string;
  addressMotel: string;

  cities = new Array<City>();
  city: City;

  provinces = new Array<Province>();
  province: Province;

  phoneMotel;

  motelprevous:Motel;
  constructor(private behaviorSubjectClass: BehaviorSubjectClass,private router: Router,private cityService: CitiesService, private provinceService: ProvincesService,public motelService:MotelService) {
    this.behaviorSubjectClass.getDataMotel().subscribe(motel => {
      this.motelprevous = motel;
      if(this.motelprevous){
        this.nameMotel = this.motelprevous.name;
        this.phoneMotel = this.motelprevous.phone;
        this.addressMotel = this.motelprevous.address;
      }
    });

  }

  ngOnInit(): void {
    this.getCities();
    this.typeMotel = "Mua";
  }

  public onClickTypeMotelButton() {
    this.typeMotel = "Thuê"
  }

  public onChangeCity(event)
  {
    let value = event.target.value;
    var id = this.cities.find(m => m.id == value);
    this.city = id;
    this.getProvinceById(value);
  }

  public onChangeProvince(event)
  {
    let value = event.target.value;
    var id = this.provinces.find(m => m.id == value);
    this.province = id;
  }

  public getProvinceById(ID){
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

  public getCities(){
    this.cityService.getCitys().subscribe(getcity => this.cities = getcity)
  }

  public next(){
    let motel = new Motel(); 
    motel.name = this.nameMotel;
    motel.typemotel = this.typeMotel;
    motel.cityId = this.city.id;
    motel.provinceId = this.province.id;
    motel.address = this.addressMotel;
    motel.phone = this.phoneMotel;
    this.behaviorSubjectClass.setDataMotel(motel);
    this.router.navigateByUrl('/user/thong-tin-nha-tro');
  }

  public prevous(){
    this.router.navigateByUrl('/user/danh-muc');
  }
}
