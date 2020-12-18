import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { User } from '../model/User';
import { LikeMotel } from '../model/LikeMotel';
import { Observable,of, from, BehaviorSubject } from 'rxjs';
import { map ,tap, catchError} from 'rxjs/operators';
import { Account } from '../model/Employee';

const httpOptions ={
  headers: new HttpHeaders({'Content-Type': 'application/json'})
};

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private urlAPI = 'https://localhost:44324';

  private AccountPhone: BehaviorSubject<Account> = new BehaviorSubject(null);

  messgerImage = new BehaviorSubject<string>("default message");
  currentImage = this.messgerImage.asObservable();

  // method này để change source message 
  changeMessage(message) {
    this.messgerImage.next(message);
  }
  
  getAccountPhone(): Observable<Account> {
    return this.AccountPhone.asObservable();
  }

  setAccountPhone(account: Account) {
    this.AccountPhone.next(account);
  }

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

  public addlike(newlike: LikeMotel): Observable<LikeMotel>{
    return this.http.post<LikeMotel>(this.urlAPI + "/api/LikeMotels", newlike, httpOptions).pipe(
      tap((like: LikeMotel) => like),
      catchError(error => of(new LikeMotel()))
    );
  }

  public deletelike(newlikeid: number): Observable<LikeMotel>{
    const url = `${this.urlAPI + "/api/LikeMotels"}/${newlikeid}`;
    return this.http.delete<LikeMotel>(url, httpOptions).pipe(
      tap(selectUser => selectUser),
      catchError(error => of(null))
    );
  }

  public getlikeuser(userid: number): Observable<LikeMotel[]>{
    const url = `${this.urlAPI + "/api/LikeMotels/GetLikeUser"}/${userid}`;
    return this.http.get<LikeMotel[]>(url).pipe(
      tap(selectLikeUser => console.log(`selectLikeUser = ${JSON.stringify(selectLikeUser)}`)),
      catchError(error => of([]))
    );
  }

  public updateAccount(account: Account): Observable<any>{
    return this.http.put(`${this.urlAPI + "/api/Accounts"}/${account.id}`, account, httpOptions).pipe(
      tap(updateAccount => console.log(`selectLikeUser = ${JSON.stringify(updateAccount)}`)),
      catchError(error => of(new Account()))
    );
  }

  public updateUser(user: User): Observable<any>{
    return this.http.put(`${this.urlAPI + "/api/Users"}/${user.id}`, user, httpOptions).pipe(
      tap(updateUser =>  console.log(`selectLikeUser = ${JSON.stringify(updateUser)}`)),
      catchError(error => of(new User()))
    );
  }
}
