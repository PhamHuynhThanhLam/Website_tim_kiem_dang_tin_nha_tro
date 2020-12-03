import { Injectable } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Account } from '../model/Account';

@Injectable({
  providedIn: 'root'
})
export class RegisterService {
  private urlAPI = 'https://localhost:44358';

  constructor( private http: HttpClient) { }

  
  public addAccount = async (account: Account) => {
    try {
        const loginUrl = `${this.urlAPI}/api/Accounts/Normal`;
        return await this.http.post(loginUrl, account).toPromise();
    }
    catch (error) {
      console.log(error);
    }
  }
  
}
