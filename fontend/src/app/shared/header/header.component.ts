import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../../serviceapits/authentication.service';
import { Account } from  '../../model/Account';
import { Router, NavigationEnd, NavigationStart } from '@angular/router';

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  public username:string;
  currentAccount: Account;

  constructor(private router: Router,
    private authenticationService: AuthenticationService) { 
      this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    }

  ngOnInit(): void {
  }
  
  get isUser() {
    try{
      var role = Number(this.currentAccount.roleId);
      if(role == 1){
          this.username = this.currentAccount.user.firstName + this.currentAccount.user.lastName;
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
