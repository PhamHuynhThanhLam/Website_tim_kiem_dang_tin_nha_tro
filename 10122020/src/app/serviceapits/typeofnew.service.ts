import { Injectable } from '@angular/core';
import { Typeofnew } from '../model/Typeofnew';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { Observable,of, from } from 'rxjs';
import { map ,tap, catchError} from 'rxjs/operators';

const httpOptions ={
  headers: new HttpHeaders({'Content-Type': 'application/json'})
};


@Injectable({
  providedIn: 'root'
})
export class TypeofnewService {

  private urlAPI = 'https://localhost:44358';

  constructor( private http: HttpClient) { }

  public getTypes(): Observable<Typeofnew[]> {
    return this.http.get<Typeofnew[]>(this.urlAPI + "/api/Typeofnews").pipe(
      tap(receivedTypeofnews => console.log(`receivedTypeofnews = ${JSON.stringify(receivedTypeofnews)}`)),
      catchError(error => of([]))
    );
  }

}
