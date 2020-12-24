import { Component, OnInit } from '@angular/core';
import { UserService } from '../../../services/user.service'
import { Router } from '@angular/router';
import { Account } from '../../../model/Account';
import { AuthenticationService } from '../../../services/authentication.service';
import { Motel } from '../../../model/Motel';
import { MotelService } from '../../../services/motel.service'

@Component({
  selector: 'app-tindalive',
  templateUrl: './tindalive.component.html',
  styleUrls: ['./tindalive.component.css']
})
export class TindaliveComponent implements OnInit {

  nametophead = "Quản lý đăng lưu"
  /*
  
  likemotels:LikeMotel[];
  currentAccount: Account;
  motels: Motel[];
  motellikes: Motel[];*/
  constructor(private motelService: MotelService,private authenticationService: AuthenticationService,public userService:UserService) { 
    //this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
  }

  ngOnInit(): void {
  }
 /*
  public getCitys(){
    this.userService.getlikeuser(this.currentAccount.user.id).subscribe(getcity => this.likemotels = getcity)
    this.motelService.getMotels().subscribe(getmotel => {
      this.motels = getmotel
      console.log(this.motels);
    })
    for(let i=0; i< this.likemotels.length; i++){
      this.motellikes.push(this.motels.find(a => Number(a.id) == this.likemotels[i].idmotel))
    }
  }*/
}
