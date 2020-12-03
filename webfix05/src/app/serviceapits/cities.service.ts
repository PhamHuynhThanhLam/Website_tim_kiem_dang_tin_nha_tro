import { Injectable } from '@angular/core';
import { City } from '../model/City';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CitiesService {

  private urlAPI = 'https://localhost:44358';

  constructor( private http: HttpClient) { }

  public getCitys = async () => {
    try {
        const Cities = await fetch(`${this.urlAPI}/api/Cities`);
        return await Cities.json();
    }
    catch (error) {
       console.log(error);
    }  
  }
}
