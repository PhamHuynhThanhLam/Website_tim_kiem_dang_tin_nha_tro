import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { Account } from  '../../../../model/Account';
import { User } from  '../../../..//model/User';
import { Router } from '@angular/router';
import { UserService } from 'src/app/serviceapits/user.service';
import { RegisterService } from 'src/app/serviceapits/register.service';
import firebase from 'firebase';
import { AuthenticationService } from 'src/app/serviceapits/authentication.service';

@Component({
  selector: 'app-dialogeditphone',
  templateUrl: './dialogeditphone.component.html',
  styleUrls: ['./dialogeditphone.component.css']
})
export class DialogeditphoneComponent implements OnInit {

  public phone;
  public name:string;
  public confirmPassword:string;
  public recaptchaVerifier: firebase.auth.RecaptchaVerifier;

  public phone_number:string;
  public user: any;
  public comfirm :firebase.auth.ConfirmationResult;

  constructor(public dialogRef: MatDialogRef<DialogeditphoneComponent>,@Inject(MAT_DIALOG_DATA) public data: User,private authenticationService: AuthenticationService,
      private router: Router,
      private service: RegisterService,private userService:UserService) {
        const firebaseConfig = {
          apiKey: "AIzaSyAA7gAsuYi-IeYgqUEcl6bojuu4wtjjmh8",
          authDomain: "nhatrofirebase-f21b1.firebaseapp.com",
          databaseURL: "https://nhatrofirebase-f21b1.firebaseio.com",
          projectId: "nhatrofirebase-f21b1",
          storageBucket: "nhatrofirebase-f21b1.appspot.com",
          messagingSenderId: "1075985834413",
          appId: "1:1075985834413:web:ab82dcc8e62bec7fdf0124",
          measurementId: "G-N91ZYC8X9M"
        };
        if (!firebase.apps.length) {
  
          firebase.initializeApp(firebaseConfig);
        }
       }
  

  ngOnInit(): void {
  }

  onSubmit() {
    const appVerifier = this.recaptchaVerifier;
    var p = this.phone;

    var phoneNumber = "+84" + p.substring(0, p.length);
    //var phoneNumber =  "+84968320200";
    console.log(phoneNumber);
    var testVerificationCode = "123456";
    firebase.auth().signInWithPhoneNumber(phoneNumber, appVerifier)
      .then((confirmationResult) => {
        this.comfirm = confirmationResult;
        
      })
      .catch((err) => {
        console.log('sms not sent', err);
      });
  };


  public Xacthuc = async () => {
    try {
      const verification = this.phone_number;
      console.log(this.phone_number);
      if (verification != null) {
        console.log(verification);
        this.comfirm.confirm(verification).then(async () =>{
          let account = new Account();
          account.phone = this.phone;
          this.userService.setAccountPhone(account);
          
          alert('Success');
        }).catch(err =>{
          alert(err);
        })
      } else {
        alert('No verification code entered');
      }
    }
    catch (e) {
      alert('Add failed');
    }
  };
}
