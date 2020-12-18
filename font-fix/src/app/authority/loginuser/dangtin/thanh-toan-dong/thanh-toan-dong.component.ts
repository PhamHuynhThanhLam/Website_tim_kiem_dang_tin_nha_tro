import { Component, OnInit } from '@angular/core';
import { HttpClient } from '@angular/common/http';
import { Input } from '@angular/core';
import { Motel,Image } from '../../../../model/Motel';
import { Account } from '../../../../model/Account';
import { DangtinService } from '../../../../serviceapits/dangtin.service';
import { PriceService } from '../../../../serviceapits/price.service';

import { AngularFireStorage } from '@angular/fire/storage';
import { finalize } from 'rxjs/operators';
import { DomSanitizer,SafeUrl, SafeResourceUrl } from '@angular/platform-browser';
import { AuthenticationService} from '../../../../serviceapits/authentication.service'

import { Router } from '@angular/router';
import { Serviceprice } from 'src/app/model/Serviceprice';

@Component({
  selector: 'app-thanh-toan-dong',
  templateUrl: './thanh-toan-dong.component.html',
  styleUrls: ['./thanh-toan-dong.component.css']
})
export class ThanhToanDongComponent implements OnInit {

  //take data
  @Input() datatypeofnew;

  public new: string;
  public datatime:string;
  public image: File [] = [];
  
  motelnew: Motel;
  imagesURL:Array<string> = [];
  addimages:Image;
  public currentAccount:Account;
  
  result:Motel[];

  moteltakeprice:Motel;
  constructor(private priceService: PriceService,private router: Router,private authenticationService: AuthenticationService,private _sanitizer: DomSanitizer,private storage: AngularFireStorage,private http:HttpClient,public dangtinService:DangtinService,public data:DangtinService) {
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
  }


  ngOnInit(): void {
    this.data.getdatamotel().subscribe(motel => {
      this.moteltakeprice = motel

    });
    
  }

  public getSantizeUrl(url : string) {
    return this._sanitizer.bypassSecurityTrustResourceUrl(url);
  }

  public loadimage = async () => {
    for(let i=0; i< this.image.length;i++){
      var temp = this.image.length;
      var filePath = `${this.motelnew.name}/${this.image[i].name.split('.').slice(0, -1).join('.')}_${new Date().getTime()}`;
      const fileRef = this.storage.ref(filePath);
      console.log(filePath);
      this.storage.upload(filePath, this.image[i]).snapshotChanges().pipe(
        finalize(() => {
          fileRef.getDownloadURL().subscribe((url) => {
            this.imagesURL.push(url);
            console.log(this.imagesURL);
            if(Number(this.image.length) == Number(this.imagesURL.length)){
              this.save();
            }
          })
        })
      ) .subscribe();
    } 
    
  }

  public save = async () => {
    try 
    {
      console.log(this.imagesURL.length);
      console.log(this.currentAccount.user.id);
      if(this.imagesURL.length){
        console.log( this.motelnew);
        this.motelnew.detail.typeofnewId = this.datatypeofnew.id;  
        this.motelnew.userid = this.currentAccount.user.id;
        //this.motelnew.typeservice = this.new;
        //this.motelnew.time = this.datatime;
        
        let Finall:Image[] = [];
        for(let i=0;i<this.imagesURL.length;i++)
        {
          this.addimages = {
            imageMotel: this.imagesURL[i]
          }
          Finall.push(this.addimages);
        }
        console.log(Finall);
        this.motelnew.images = Finall;
        console.log( this.motelnew.images);
        console.log( this.motelnew);
        this.dangtinService.postMotel(this.motelnew).subscribe(newMotel => {
          this.result.push(newMotel);
        });
        console.log(this.result);
        alert('Add sucessfully');
        this.router.navigateByUrl('/user/danhmuc');
      }
      else{
        alert('Add failed');
      }
    }
    catch (e) {
      alert('Add failed');
      console.log(e);
    }
  }
  public onsubmit = async () => {
    this.data.getdataimages().subscribe(motel => this.image = motel);
    this.data.getProfileObs().subscribe(profile => this.datatypeofnew = profile);
    this.data.getdatamotel().subscribe(motel => this.motelnew = motel);
    console.log(this.image);
    this.loadimage();
  };
  
}
