import { Component, EventEmitter, OnDestroy, OnInit, Output } from '@angular/core';
import { Router } from '@angular/router';
import { Account } from  '../../../model/Account';
import { User } from  '../../../model/User';
import { AuthenticationService } from '../../../serviceapits/authentication.service';
import { UserService } from '../../../serviceapits/user.service';
import {MatDialog, MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { DialogedituserComponent } from './dialogedituser/dialogedituser.component';
import { DialogeditphoneComponent } from './dialogeditphone/dialogeditphone.component';
import { DialogeditpasswordComponent } from './dialogeditpassword/dialogeditpassword.component';
import { DangtinService } from 'src/app/serviceapits/dangtin.service';
import { Motel } from 'src/app/model/Motel';

@Component({
  selector: 'app-profileuser',
  templateUrl: './profileuser.component.html',
  styleUrls: ['./profileuser.component.css']
})
export class ProfileuserComponent implements OnInit {


  currentAccount: Account;
  account: Account;
  dialogUser: User;

  //motel
  motels: Motel[];

  //pagination
  totalRecord: Number;
  page:Number = 1;
  hasmotel;
  
  selectname = "Thông tin cá nhân"
  constructor(private motelService: DangtinService,public dialog: MatDialog,private router: Router,private authenticationService: AuthenticationService,private userService: UserService) {
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    
   }

  
  ngOnInit(): void {
    this.hasmotel = "";
    this.getuser();
    this.getMotels();
   
  }

  handlePageChange(event) {
    this.page = event;
  }


  public getMotels(){
    this.motelService.getmotelbyuser(this.currentAccount.user.id).subscribe(getmotel => {
      this.motels = getmotel
      console.log(this.motels);
      if(this.motels.length){
        this.hasmotel = "Has data";
      }
      console.log(this.hasmotel)
      this.totalRecord = this.motels.length;
    })
  }

  public getuser(){
    console.log(this.currentAccount.user.id)
    var id = Number(this.currentAccount.user.id);
    this.userService.getUserFromId(id).subscribe(getuser => {
      this.dialogUser = getuser
      console.log(this.dialogUser)
    });
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
  
  openDialog(): void {
   console.log(this.dialogUser)
    const dialogRef = this.dialog.open(DialogedituserComponent, {
      direction: "ltr",
      width: '400px',
      data: this.dialogUser
    });

    dialogRef.afterClosed().subscribe((result: User) => {
      if (result)
      {
        console.log('The dialog was closed');
        console.log(result);
      }
    });
  }

  openDialogEditPhone(): void {
    console.log(this.dialogUser)
     const dialogRef = this.dialog.open(DialogeditphoneComponent, {
       direction: "ltr",
       width: '400px',
       data: this.dialogUser
     });
 
     dialogRef.afterClosed().subscribe((result: User) => {
       if (result)
       {
        console.log('The dialog was closed');
        console.log(result);
        if(this.userService.getAccountPhone())
        {
          var account = new Account();
          account.id = result.account.id;
          account.isactive = result.account.isactive;
          account.roleId = result.account.roleId;
          account.username = result.account.username;      
          account.password = result.account.password;
          //Lưa dat mới
          var phone = new Account()
          this.userService.getAccountPhone().subscribe(account => phone == account);
          account.phone = phone.phone;
          this.userService.updateAccount(account).subscribe(update => {
            alert("Lưu thành công")
          });
        }
        

       }
         
     });
   }

   openDialogEditPassword(): void {
    console.log(this.dialogUser)
     const dialogRef = this.dialog.open(DialogeditpasswordComponent, {
       direction: "ltr",
       width: '400px',
       data: this.dialogUser
     });
 
     dialogRef.afterClosed().subscribe((result: User) => {
       if (result)
       {
        console.log('The dialog was closed');
        console.log(result);
        var account = new Account();
        account.id = result.account.id;
        account.isactive = result.account.isactive;
        account.roleId = result.account.roleId;
        account.username = result.account.username;
        //Lưa dat mới
        account.password = result.account.password;

        this.userService.updateAccount(account).subscribe(update => {
          if(update){
            alert("Lưu thành công")
          }
        });
       }
         
     });
   }
}
