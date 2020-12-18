import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../../serviceapits/authentication.service';
import { Router, NavigationEnd, NavigationStart } from '@angular/router';
import { Account } from  '../../model/Account';

@Component({
  selector: 'app-loginuser',
  templateUrl: './loginuser.component.html',
  styleUrls: ['./loginuser.component.css']
})
export class LoginuserComponent implements OnInit {
  public username:string;
  currentAccount: Account;

  constructor(private router: Router,
    private authenticationService: AuthenticationService) { 
      this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    }

  ngOnInit(): void {
  }

  public onLogout = () => {
    this.authenticationService.logout();
    window.location.reload();
    this.router.navigate(['/home']);
    this.username = '';
  }  
}
