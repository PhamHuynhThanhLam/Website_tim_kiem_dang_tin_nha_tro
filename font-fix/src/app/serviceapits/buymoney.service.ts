import { Injectable } from '@angular/core';
import { BuyMoney } from '../model/BuyMoney';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable,of, from } from 'rxjs';
import { map ,tap, catchError} from 'rxjs/operators';
import { Bill } from '../model/Bill';

const httpOptions ={
  headers: new HttpHeaders({'Content-Type': 'application/json'})
};

@Injectable({
  providedIn: 'root'
})
export class BuymoneyService {

  private urlAPI = 'https://localhost:44324';

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

  public getBills(id: string): Observable<Bill[]> {
    const url = `${this.urlAPI + "/api/Bills/BillUser"}/${id}`;
    return this.http.get<Bill[]>(url).pipe(
      tap(selectBills => selectBills),
      catchError(error => of([]))
    );
  }

  public getAdminBills(): Observable<Bill[]> {
    return this.http.get<Bill[]>(this.urlAPI + "/api/Bills").pipe(
      tap(receivedBills => receivedBills),
      catchError(error => of([]))
    );
  }

  public getNowsBills(): Observable<Bill[]> {
    return this.http.get<Bill[]>(this.urlAPI + "/api/Bills/Nows").pipe(
      tap(receivedNowsBills => receivedNowsBills),
      catchError(error => of([]))
    );
  }
}
