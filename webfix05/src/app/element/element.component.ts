import { Component, OnInit } from '@angular/core';
import { CitiesService } from '../../app/serviceapits/cities.service'
import { City } from '../model/City';
import { Province } from '../model/Province';
import { ProvincesService } from '../../app/serviceapits/provinces.service'

@Component({
  selector: 'app-element',
  templateUrl: './element.component.html',
  styleUrls: ['./element.component.css']
})
export class ElementComponent implements OnInit {

  public cities = new Array<City>();

  public provinces = new Array<Province>();
  public idcity: string;

  constructor(private cityService: CitiesService, private provinceService: ProvincesService) { }

  async ngOnInit(): Promise<void> {
    //await this.getCitys();
    this.getCitys();
    this.idcity = "";
    console.log(this.cities);
  }

  public onprovince = async (id) => {
    this.idcity = id;
    if(this.idcity == ""){
      alert("Chọn thành phố trước");
    }
    else{
      const list = this.provinceService.getProvincesByCity(this.idcity).subscribe((data) => {
        let province = new Province();
        province.id = data.id;
        province.name = data.name;
        console.log(province);
        this.provinces.push(province);
      })
    }
    
  }
  public getCitys = async () => {
    const list = await this.cityService.getCitys();
    for (let i = 0; i < list.length; i++) {
      let cities = new City();
      cities.id = list[i].id;
      cities.name = list[i].name;
      this.cities.push(cities);
    }
  }

 
}
