import { HttpClient } from '@angular/common/http';
import { Input } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Motel,Image } from '../../model/Motel';
import { Account } from '../../model/Account';
import { DangtinService } from '../../serviceapits/dangtin.service';

import { AngularFireStorage } from '@angular/fire/storage';
import { finalize } from 'rxjs/operators';
import { DomSanitizer,SafeUrl, SafeResourceUrl } from '@angular/platform-browser';
import { AuthenticationService} from '../../serviceapits/authentication.service'

import { Router } from '@angular/router';

export interface Type{
  id:number;
  text:string;
}

@Component({
  selector: 'app-chon-goi-tin-thanh-toan',
  templateUrl: './chon-goi-tin-thanh-toan.component.html',
  styleUrls: ['./chon-goi-tin-thanh-toan.component.css']
})
export class ChonGoiTinThanhToanComponent implements OnInit {

  public news:Array<Type> = [
    {id: 1, text:'Tin Hot'}, // 4 tuần, 2 tuần
    {id: 2, text:'Tin VIP 30'}, // 
    {id: 3, text:'Tin VIP 20'},
    {id: 4, text:'Tin VIP 10'},
    {id: 5, text:'Tin thường'},
  ];
  
  public times:Array<Type> = [
    {id: 1, text:'Đăng theo ngày'}, 
    {id: 2, text:'Đăng theo tuần'}, 
    {id: 3, text:'Đăng theo tháng'},
  ];

  @Input() time: string;

  public months:Array<Type> = [
    {id: 1, text:'1 Tháng'}, 
    {id: 2, text:'2 Tháng'}, 
    {id: 3, text:'3 Tháng'}, 
    {id: 4, text:'4 Tháng'}, 
    {id: 5, text:'5 Tháng'}, 
    {id: 6, text:'6 Tháng'}, 
    {id: 7, text:'7 Tháng'}, 
    {id: 8, text:'8 Tháng'}, 
    {id: 9, text:'9 Tháng'}, 
    {id: 10, text:'10 Tháng'}, 
    {id: 11, text:'11 Tháng'}, 
    {id: 12, text:'12 Tháng'}, 
  ];

  public days:Array<Type> = [
    {id: 1, text:'6 Ngày'}, 
    {id: 2, text:'7 Ngày'}, 
    {id: 3, text:'8 Ngày'}, 
    {id: 4, text:'9 Ngày'}, 
    {id: 5, text:'10 Ngày'}, 
    {id: 6, text:'11 Ngày'}, 
    {id: 7, text:'12 Ngày'}, 
    {id: 8, text:'13 Ngày'}, 
    {id: 9, text:'14 Ngày'}, 
    {id: 10, text:'15 Ngày'}, 
    {id: 11, text:'16 Ngày'}, 
    {id: 12, text:'17 Ngày'}, 
  ];

  public weeks:Array<Type> = [
    {id: 1, text:'1 Tuần'}, 
    {id: 2, text:'2 Tuần'}, 
    {id: 3, text:'3 Tuần'}, 
    {id: 4, text:'4 Tuần'}, 
    {id: 5, text:'5 Tuần'}, 
    {id: 6, text:'6 Tuần'}, 
    {id: 7, text:'7 Tuần'}, 
    {id: 8, text:'8 Tuần'}, 
    {id: 9, text:'9 Tuần'}, 
    {id: 10, text:'10 Tuần'}, 
  ];

  setch: string = "Số ngày";
  setchoces: Array<Type> = [];
  
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
  constructor(private router: Router,private authenticationService: AuthenticationService,private _sanitizer: DomSanitizer,private storage: AngularFireStorage,private http:HttpClient,public dangtinService:DangtinService,public data:DangtinService) {
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
  }

  ngOnInit(): void {
    this.setchoces = this.days;
    this.new = ""
  }



  onChangesetch(event){
    let value = event.target.value;
    var name = this.setchoces[value].text.toString();
    console.log(this.setchoces[value].text)
    console.log(this.datatypeofnew);
    this.datatime = name;
    console.log(this.currentAccount);
  }

  onChangetime(event){
    try{
      let value = event.target.value;
      var name = this.times[value].text.toString();
      console.log(this.times[value].text)
      this.time = name;
  
      console.log(value);
      if(Number(value) == 1){
        this.setch = "Số ngày";
        this.setchoces = this.days;
      }
      else if(Number(value) == 2){
        this.setch = "Số tuần";
        this.setchoces = this.weeks;
      }
      else {
        this.setch = "Số tháng";
        this.setchoces = this.months;
      }
    }
    catch(error){
      this.setch = "Số tháng";
      this.setchoces = this.months;
    }  
  }

  onChange(event)
  {
    try{

    }
    catch (error){
      let value = event.target.value;
      var name = this.news[value].text.toString();
      console.log(this.news[value].text)
      this.new = name;
    }

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
        this.motelnew.typeservice = this.new;
        this.motelnew.time = this.datatime;
        
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
