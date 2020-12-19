import { Component, OnInit } from '@angular/core';
import { DangtinService } from '../serviceapits/dangtin.service';
import { Motel,Image } from '../model/Motel';
import { Province } from '../model/Province';
import { Router, ActivatedRoute } from '@angular/router'
import { SafeHtml, DomSanitizer } from '@angular/platform-browser';
import { UserService } from '../serviceapits/user.service'
import { LikeMotel } from '../model/LikeMotel';
import { MatDialog, MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { DialogsendComponent } from './dialogsend/dialogsend.component';
import { ProvincesService } from '../serviceapits/provinces.service';

@Component({
  selector: 'app-trang-chi-tiet',
  templateUrl: './trang-chi-tiet.component.html',
  styleUrls: ['./trang-chi-tiet.component.css']
})
export class TrangChiTietComponent implements OnInit {

  motel: Motel;
  countimage;
  motelrecommendation:Motel[];
  provincename;
  provinces:Province[];
  constructor(public provinceService:ProvincesService,public dialog: MatDialog,private userService:UserService,private sanitizer: DomSanitizer,private router: ActivatedRoute,public dangtinService:DangtinService) {
    this.gtmotelbyid();
   }

  ngOnInit(): void {
    
    this.getmotelbyprovince();
  }

  public gtmotelbyid(){
    const id = this.router.snapshot.paramMap.get("id");
    this.dangtinService.getMotelFromId(Number(id)).subscribe(getdetailmotel => {
      this.motel = getdetailmotel
      console.log(this.motel);
      this.countimage = this.motel.images.length;
      console.log(this.countimage)
    })
  }

  public getmotelbyprovince(){
    var provinceid = this.motel.provinceid;
    console.log(provinceid);
    this.dangtinService.getmotelprovinces(provinceid).subscribe(getmotellist =>{
      this.motelrecommendation = getmotellist;
      console.log(this.motelrecommendation);
    })
  }

  public getprovinces(){
    this.provinceService.getProvinces().subscribe(getprovince =>{
      this.provinces = getprovince;
      var a = this.provinces.find(a => a.id == this.motel.provinceid);
      this.provincename = a.name;

    })
  }

  openDialog(): void {
    const dialogRef = this.dialog.open(DialogsendComponent, {
      direction: "ltr",
      width: '400px'
      //data: this.dialogExam
    });

    dialogRef.afterClosed().subscribe((result: Motel) => {
      if (result)
      {
        console.log('The dialog was closed');
        console.log(result);
        //if (!this.isEdit) this.createNewExam(result);
        //else this.updateExam(result);
      }
        
    });
  }

  getHTML(html: string): SafeHtml
  {
    return this.sanitizer.bypassSecurityTrustHtml(html);
  }

  delete(userid:number){
    this.userService.deletelike(userid).subscribe(_ => {
      console.log(userid);
    })
  }
}
