import { Injectable } from '@angular/core';
import { City } from '../model/City';
import { HttpClient, HttpHeaders } from '@angular/common/http';

@Injectable({
  providedIn: 'root'
})
export class CitiesService {

  private urlAPI = 'https://localhost:44358';

  constructor( private http: HttpClient) { }

  getCitys = async () => {
    try {
      return await this.http.get(this.urlAPI + '/api/Cities').toPromise();
    }
    catch (e) {
      console.log(e);
    }
  }
}
