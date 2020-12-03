import { Injectable } from '@angular/core';
import { Province } from '../model/Province';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { map } from 'rxjs/operators';

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

  public getProvincesByCity = (id: string) => {
    const getUrl = `${this.urlAPI}/api/Provinces/GetProvince/${id}`;
        return this.http.get<any>(getUrl).pipe(
            map((province) => {
                if(province != null)
                {
                  const getprovinces = {} as Province;
                  getprovinces.id = province.id;
                  getprovinces.name = province.name;
                  getprovinces.cityid = province.cityId;
                  return getprovinces;
                }
                else{
                    return null;
                }
            })
        )
  }
}
