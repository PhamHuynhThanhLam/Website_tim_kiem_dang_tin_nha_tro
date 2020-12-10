import { Component, OnInit } from '@angular/core';
import { CitiesService } from '../../serviceapits/cities.service'
import { City } from '../../model/City';
import { Typeofnew } from '../../model/Typeofnew';
import { Province } from '../../model/Province';
import { Motel } from '../../model/Motel';
import { ProvincesService } from '../../serviceapits/provinces.service'
import { TypeofnewService } from '../../serviceapits/typeofnew.service'
import { DangtinService } from '../../serviceapits/dangtin.service'
import { Router } from '@angular/router';

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

 
  constructor(private router: Router,private motelService: DangtinService,private cityService: CitiesService, private provinceService: ProvincesService, private typeservice:TypeofnewService) { }


  ngOnInit(): void {
    this.getCitys();
    this.getTypes();
    this.city = "";
    console.log(this.cities);
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
