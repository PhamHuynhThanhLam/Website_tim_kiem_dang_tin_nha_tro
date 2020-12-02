import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { map } from 'rxjs/operators';
import { User } from '../model/User';

@Injectable({
  providedIn: 'root'
})
export class UserService {
  private urlAPI = 'https://localhost:44358';
  constructor(private http: HttpClient) { }

  public getsearchemail = (email: string) => {
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
  }

  public adduser = async (user: User) => {
    try {
        const loginUrl = `${this.urlAPI}/api/Users/Normal`;
        return await this.http.post(loginUrl, user).toPromise();
    }
    catch (error) {
      console.log(error);
    }
  }
}
