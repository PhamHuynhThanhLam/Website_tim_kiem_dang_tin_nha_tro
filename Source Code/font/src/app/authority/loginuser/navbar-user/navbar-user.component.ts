import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../../../services/authentication.service';
import { Account } from  '../../../model/Account';
import { Router, NavigationEnd, NavigationStart } from '@angular/router';
import { ReplyService } from 'src/app/services/reply.service';
import { Reply } from 'src/app/model/Reply';

@Component({
  selector: 'app-navbar-user',
  templateUrl: './navbar-user.component.html',
  styleUrls: ['./navbar-user.component.css']
})
export class NavbarUserComponent implements OnInit {

  reply:Reply[];
  countReply = 0;
  
  public username:string;
  currentAccount: Account;

  constructor(private replyService:ReplyService,
    private router: Router,
    private authenticationService: AuthenticationService) { 
      this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
      this.getReply();
    }

  ngOnInit(): void {
  }
  
  public getReply(){
    this.replyService.getReplyFromUserId(this.currentAccount.user.id).subscribe(data => {
      this.reply = data;
      
      for(let i=0;i<this.reply.length;i++){
        if(this.reply[i].isSee == false){
          this.countReply = this.countReply + 1
        }
      }

    })
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
