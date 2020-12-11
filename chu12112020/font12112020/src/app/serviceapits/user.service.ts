import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { User } from '../model/User';
import { Observable,of, from } from 'rxjs';
import { map ,tap, catchError} from 'rxjs/operators';

const httpOptions ={
  headers: new HttpHeaders({'Content-Type': 'application/json'})
};

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private urlAPI = 'https://localhost:44358';
  constructor(private http: HttpClient) { }

  public getsearchemail(email: string): Observable<User>{
    const url = `${this.urlAPI + "/api/Users/GetUser"}/${email}`;
    return this.http.get<User>(url).pipe(
      tap(selectUserByEmail => console.log(`selectUserByEmail = ${JSON.stringify(selectUserByEmail)}`)),
      catchError(error => of(new User))
    );
  }


  /*public getsearchemail = (email: string) => {
    const getUrl = `${this.urlAPI}/api/Users/GetUser/${email}`;
        return this.http.get<any>(getUrl).pipe(
            map((users) => {
                if(users == '')
                {
                    return true;
                }
                else{
                    return false;
                }
            })
        )
  }*/

  public adduser(newcuser: User): Observable<User>{
    return this.http.post<User>(this.urlAPI + "/api/Users/Normal", newcuser, httpOptions).pipe(
      tap((user: User) => console.log(`inserted User = ${JSON.stringify(user)}`)),
      catchError(error => of(new User()))
    );
  }

  /*public adduser = async (user: User) => {
    try {
        const loginUrl = `${this.urlAPI}/api/Users/Normal`;
        return await this.http.post(loginUrl, user).toPromise();
    }
    catch (error) {
      console.log(error);
    }
  }*/


  public getUserFromId(id: number): Observable<User>{
    const url = `${this.urlAPI + "/api/Users"}/${id}`;
    return this.http.get<User>(url).pipe(
      tap(selectUser => selectUser),
      catchError(error => of(new User()))
    );
  }
}
