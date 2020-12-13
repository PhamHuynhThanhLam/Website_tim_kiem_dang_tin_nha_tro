import { Injectable } from '@angular/core';
import { Province } from '../model/Province';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable,of, from } from 'rxjs';
import { map ,tap, catchError} from 'rxjs/operators';

const httpOptions ={
  headers: new HttpHeaders({'Content-Type': 'application/json'})
};

@Injectable({
  providedIn: 'root'
})
export class ProvincesService {

  private urlAPI = 'https://localhost:44358';

  constructor( private http: HttpClient) { }


  public getProvinces(): Observable<Province[]> {
    return this.http.get<Province[]>(this.urlAPI + "/api/Provinces").pipe(
      tap(receivedProvinces => console.log(`receivedProvinces = ${JSON.stringify(receivedProvinces)}`)),
      catchError(error => of([]))
    );
  }

  public getCityFromId(id: number): Observable<Province>{
    const url = `${this.urlAPI + "/api/Provinces"}/${id}`;
    return this.http.get<Province>(url).pipe(
      tap(selectProvince => console.log(`selectProvince = ${JSON.stringify(selectProvince)}`)),
      catchError(error => of(new Province()))
    );
  }

  public updateCity(province: Province): Observable<any>{
    return this.http.put(`${this.urlAPI + "/api/Provinces"}/${province.id}`, province, httpOptions).pipe(
      tap(updateProvince => console.log(`update Province = ${JSON.stringify(updateProvince)}`)),
      catchError(error => of(new Province()))
    );
  }

  public addcity(newprovince: Province): Observable<Province>{
    return this.http.post<Province>(this.urlAPI + "/api/Provinces", newprovince, httpOptions).pipe(
      tap((province: Province) => console.log(`inserted Province = ${JSON.stringify(province)}`)),
      catchError(error => of(new Province()))
    );
  }

  public getProvincesByCity(id: number): Observable<Province[]>{
    const url = `${this.urlAPI + "/api/Provinces/GetProvince"}/${id}`;
    return this.http.get<Province[]>(url).pipe(
      tap(selectProvinceByCity => console.log(`selectProvince = ${JSON.stringify(selectProvinceByCity)}`)),
      catchError(error => of([]))
    );
  }

}

