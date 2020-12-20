import { Component, Inject, OnInit } from '@angular/core';
import { DangtinService } from '../../../serviceapits/dangtin.service';
import { Motel,Image } from '../../../model/Motel';
import { Account } from '../../../model/Account';
import { User } from '../../../model/User';
import { Province } from '../../../model/Province';
import { Router, ActivatedRoute } from '@angular/router'
import { SafeHtml, DomSanitizer } from '@angular/platform-browser';
import { UserService } from '../../../serviceapits/user.service'
import { LikeMotel } from '../../../model/LikeMotel';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { ProvincesService } from 'src/app/serviceapits/provinces.service';
import { AuthenticationService } from '../../../serviceapits/authentication.service';

@Component({
  selector: 'app-dialogmotelduyettin',
  templateUrl: './dialogmotelduyettin.component.html',
  styleUrls: ['./dialogmotelduyettin.component.css']
})
export class DialogmotelduyettinComponent implements OnInit {
  currentAccount: Account;
  motel: Motel;
  constructor(public dialogRef: MatDialogRef<DialogmotelduyettinComponent>,@Inject(MAT_DIALOG_DATA) public data: Motel,public provinceService:ProvincesService,private userService:UserService,private sanitizer: DomSanitizer,private router: Router,public dangtinService:DangtinService ,private authenticationService: AuthenticationService) { 
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    console.log(this.data);

    const id = this.data.id;
    this.dangtinService.getMotelFromId(Number(id)).subscribe(getdetailmotel => {
      this.motel = getdetailmotel
      console.log(this.motel);
    })

  }

  ngOnInit(): void {
    
  }

  getHTML(html: string): SafeHtml
  {
    return this.sanitizer.bypassSecurityTrustHtml(html);
  }

  onNoClick(): void {
    this.dialogRef.close();
    this.router.navigate(['/admin/quanlyduyettin']);
  }

  onduyettin(motel: Motel){
    if((this.motel.verify == true && Number(this.currentAccount.roleId) == 2) || (this.motel.verifyAdmin == true && Number(this.currentAccount.roleId) == 4)){
      alert("Đã xác thực nhà trọ này");
    }
    else{
      if(Number(this.currentAccount.roleId) == 4){
        var motelupdate = new Motel();
        motelupdate = motel;
        motelupdate.verifyAdmin = true;
        motelupdate.status = "Tin đang hiển thị";
        console.log(motelupdate);
        this.dangtinService.updateMotel(motelupdate).subscribe(update => {
          console.log(update);
        })
        console.log("4");
      }
      if(Number(this.currentAccount.roleId) == 2){
        var motelupdate = new Motel();
        motelupdate = motel;
        motelupdate.verify = true;
        console.log(motelupdate);
        this.dangtinService.updateMotel(motelupdate).subscribe(update => {
          console.log(update);
        })
        console.log("2");
      }
    
    }
   
  }
}
