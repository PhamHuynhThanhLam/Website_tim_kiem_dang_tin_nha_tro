import { Injectable } from '@angular/core';
import { BuyMoney } from '../model/BuyMoney';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable,of, from } from 'rxjs';
import { map ,tap, catchError} from 'rxjs/operators';

const httpOptions ={
  headers: new HttpHeaders({'Content-Type': 'application/json'})
};

@Injectable({
  providedIn: 'root'
})
export class BuymoneyService {

  private urlAPI = 'https://localhost:44358';

  constructor( private http: HttpClient) { }

  public getBuyMoneys(): Observable<BuyMoney[]> {
    return this.http.get<BuyMoney[]>(this.urlAPI + "/api/BuyMoneys").pipe(
      tap(receivedBuyMoneys => receivedBuyMoneys),
      catchError(error => of([]))
    );
  }

  public getBuyMoneyFromId(id: number): Observable<BuyMoney>{
    const url = `${this.urlAPI + "/api/BuyMoneys"}/${id}`;
    return this.http.get<BuyMoney>(url).pipe(
      tap(selectBuyMoneys => selectBuyMoneys),
      catchError(error => of(new BuyMoney()))
    );
  }


  public addBuyMoney(newbuymoney: BuyMoney): Observable<BuyMoney>{
    return this.http.post<BuyMoney>(this.urlAPI + "/api/BuyMoneys", newbuymoney, httpOptions).pipe(
      tap((buymoney: BuyMoney) => buymoney),
      catchError(error => of(new BuyMoney()))
    );
  }
}
