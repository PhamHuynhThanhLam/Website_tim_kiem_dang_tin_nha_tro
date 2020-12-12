import { Component, EventEmitter, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { Account } from  '../../../model/Account';
import { User } from  '../../../model/User';
import { AuthenticationService } from '../../../serviceapits/authentication.service';
import { UserService } from '../../../serviceapits/user.service';

@Component({
  selector: 'app-profileuser',
  templateUrl: './profileuser.component.html',
  styleUrls: ['./profileuser.component.css']
})
export class ProfileuserComponent implements OnInit {


  currentAccount: Account;
  account: Account;

  constructor(private router: Router,private authenticationService: AuthenticationService,private userService: UserService) {
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
   }
  get isUser() {
    try{
      var role = Number(this.currentAccount.roleId);
      if(role == 1){
          this.account = this.currentAccount;
          return true;
      }
      return false;
    }
    catch(error)
    {

    }

  }
  ngOnInit(): void {

  }




}
