import { Injectable } from '@angular/core';
import { Province } from '../model/Province';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class ProvincesService {

  private urlAPI = 'https://localhost:44358';

  constructor( private http: HttpClient) { }

  getProvinces = async () => {
    try {
      return await this.http.get(this.urlAPI + "/api/Provinces").toPromise();
    }
    catch (e) {
      console.log(e);
    }
  }

  getProvincesByCity = async (id) => {
    try {
        const loginUrl = `${this.urlAPI}/api/Provinces/${id}`;
        return await this.http.get(loginUrl).toPromise();
    }
    catch (error) {
      console.log(error);
    }
  }
}
