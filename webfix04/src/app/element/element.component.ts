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

  public cities: City[]
  constructor(private cityService: CitiesService, private provinceService: ProvincesService) { }

  async ngOnInit(): Promise<void> {
    await this.getCitys();
    console.log(this.cities);
  }

  public getCitys = async () => {
    const list = await this.cityService.getCitys as any;
    this.cities = list;
    console.log(this.cities)
  }

  
}
