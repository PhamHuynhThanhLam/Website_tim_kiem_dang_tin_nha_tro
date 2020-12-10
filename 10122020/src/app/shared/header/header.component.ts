import { Component, EventEmitter, OnInit } from '@angular/core';
import { AuthenticationService } from '../../serviceapits/authentication.service';
import { Account } from  '../../model/Account';
import { Router, NavigationEnd, NavigationStart } from '@angular/router';
import { Output } from '@angular/core';
import { DangtinService } from '../../serviceapits/dangtin.service'

@Component({
  selector: 'app-header',
  templateUrl: './header.component.html',
  styleUrls: ['./header.component.css']
})
export class HeaderComponent implements OnInit {
  public username:string;
  currentAccount: Account;

  Name1 = "cho-thue-nha-tro";
  Name2 = "nha-cho-thue";
  Name3 = "cho-thue-can-ho";
  Name4 = "cho-thue-mat-bang";
  Name5 = "tim-nguoi-o-ghep";

  name: string;
  constructor(private router: Router,
    private motelService: DangtinService,
    private authenticationService: AuthenticationService) { 
      this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    }

  ngOnInit(): void {
  }
  
  onClick(name:string) {
    console.log(name);
    var chuoi = '/home'+name;
    console.log(chuoi);
    this.name = name;
    this.motelService.changeMessage(this.name);    
    this.router.navigateByUrl(chuoi);
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
