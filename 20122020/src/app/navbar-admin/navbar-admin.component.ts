import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../serviceapits/authentication.service';
import { Account } from  '../model/Account';
import { Router, NavigationEnd, NavigationStart } from '@angular/router';

@Component({
  selector: 'app-navbar-admin',
  templateUrl: './navbar-admin.component.html',
  styleUrls: ['./navbar-admin.component.css']
})
export class NavbarAdminComponent implements OnInit {

  public username:string;
  currentAccount: Account;

  constructor(private router: Router,
    private authenticationService: AuthenticationService) { 
      this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    }

  ngOnInit(): void {
  }
  
  get isAdmin() {
    try{
      var role = Number(this.currentAccount.roleId);
      if(role == 4){
          this.username = this.currentAccount.username + this.currentAccount.username;
          return true;
      }
      return false;
    }
    catch(error)
    {
      
    }
   
  }

  public onLogout = () => {
    this.authenticationService.logout();
    window.location.reload();
    this.router.navigate(['/home']);
    this.username = '';
  }  

}
