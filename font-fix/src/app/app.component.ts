import { Component } from '@angular/core';
import { AuthenticationService } from '../app/serviceapits/authentication.service';
import { Account } from  '../app/model/Account';
import { Router, NavigationEnd, NavigationStart } from '@angular/router';


@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
  title = 'giupthangchu';

  public username:string;
  public admin;
  currentAccount: Account;

  constructor(private router: Router,
    private authenticationService: AuthenticationService) { 
      this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    }
  
  get isUser() {
      try{
        var role = Number(this.currentAccount.roleId);
        if(role == 1){
            this.username = this.currentAccount.user.hovaTen;
            return true;
        }
        return false;
      }
      catch(error)
      {
        
      } 
  }

  get isAdmin() {
    try{
      var role = Number(this.currentAccount.roleId);
      if(role == 4){
          this.admin = this.currentAccount.user.hovaTen;
          return true;
      }
      return false;
    }
    catch(error)
    {
      
    }
   
  }
}
