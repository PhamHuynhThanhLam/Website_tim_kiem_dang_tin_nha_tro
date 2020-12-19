import { HttpClient } from '@angular/common/http';
import { Input } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Motel,Image, Bill } from '../../../../model/Motel';
import { Account } from '../../../../model/Account';
import { DangtinService } from '../../../../serviceapits/dangtin.service';
import { PriceService } from '../../../../serviceapits/price.service';

import { AngularFireStorage } from '@angular/fire/storage';
import { finalize } from 'rxjs/operators';
import { DomSanitizer,SafeUrl, SafeResourceUrl } from '@angular/platform-browser';
import { AuthenticationService} from '../../../../serviceapits/authentication.service'

import { Router } from '@angular/router';
import { Serviceprice } from 'src/app/model/Serviceprice';

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

  Serviceprice: Serviceprice[];
  
  public news:Array<Type> = [
    {id: 0, text:'Tin Hot'}, // 4 tuần, 2 tuần
    {id: 1, text:'Tin VIP 30'}, // 
    {id: 2, text:'Tin VIP 20'},
    {id: 3, text:'Tin VIP 10'},
    {id: 4, text:'Tin thường'},
  ];
  
  public times:Array<Type> = [
    {id: 0, text:'Đăng theo ngày'}, 
    {id: 1, text:'Đăng theo tuần'}, 
    {id: 2, text:'Đăng theo tháng'},
  ];

  @Input() time: string;

  public months:Array<Type> = [
    {id: 0, text:'1 Tháng'}, 
    {id: 1, text:'2 Tháng'}, 
    {id: 2, text:'3 Tháng'}, 
    {id: 3, text:'4 Tháng'}, 
    {id: 4, text:'5 Tháng'}, 
    {id: 5, text:'6 Tháng'}, 
    {id: 6, text:'7 Tháng'}, 
    {id: 7, text:'8 Tháng'}, 
    {id: 8, text:'9 Tháng'}, 
    {id: 9, text:'10 Tháng'}, 
    {id: 10, text:'11 Tháng'}, 
    {id: 11, text:'12 Tháng'}, 
  ];

  public days:Array<Type> = [
    {id: 0, text:'6 Ngày'}, 
    {id: 1, text:'7 Ngày'}, 
    {id: 2, text:'8 Ngày'}, 
    {id: 3, text:'9 Ngày'}, 
    {id: 4, text:'10 Ngày'}, 
    {id: 5, text:'11 Ngày'}, 
    {id: 6, text:'12 Ngày'}, 
    {id: 7, text:'13 Ngày'}, 
    {id: 8, text:'14 Ngày'}, 
    {id: 9, text:'15 Ngày'}, 
    {id: 10, text:'16 Ngày'}, 
    {id: 11, text:'17 Ngày'}, 
  ];

  public weeks:Array<Type> = [
    {id: 0, text:'1 Tuần'}, 
    {id: 1, text:'2 Tuần'}, 
    {id: 2, text:'3 Tuần'}, 
    {id: 3, text:'4 Tuần'}, 
    {id: 4, text:'5 Tuần'}, 
    {id: 5, text:'6 Tuần'}, 
    {id: 6, text:'7 Tuần'}, 
    {id: 7, text:'8 Tuần'}, 
    {id: 8, text:'9 Tuần'}, 
    {id: 9, text:'10 Tuần'}, 
  ];

  setch: string = "Số ngày";
  setchoces: Array<Type> = [];

  public new: string;
  public datatime:string;
  public image: File [] = [];

  motelnew: Motel;
  //imagesURL:Array<string> = [];
  //addimages:Image;
  //public currentAccount:Account;

  //result:Motel[];
 
  //Xét tính tiền
  totalprice:number;
  type:string[] = [];
  t:number;

  constructor(private priceService: PriceService,private router: Router,private _sanitizer: DomSanitizer,private storage: AngularFireStorage,private http:HttpClient,public dangtinService:DangtinService,public data:DangtinService) {
    
  }

  ngOnInit(): void {
    this.setchoces = this.days;
    this.new = 'Tin Hot';
    this.getServiceprices();
   
  }

  public getServiceprices(){
    this.priceService.getServiceprices().subscribe(getserviceprice => this.Serviceprice = getserviceprice)
  }


  onChangesetch(event){
    let value = event.target.value;
    var name = this.setchoces[value].text.toString();
    console.log(this.setchoces[value].text)
    this.datatime = name;
    this.tinhtien();
  }

  onChangetime(event){
    try{
      let value = event.target.value;
      var name = this.times[value].text.toString();
      console.log(this.times[value].text)
      this.time = name;
  
      console.log(value);
      if(Number(value) == 0){
        this.setch = "Số ngày";
        this.setchoces = this.days;
      }
      else if(Number(value) == 1){
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
      let value = event.target.value;
      var name = this.news[value].text.toString();
      console.log(this.news[value].text)
      this.new = name;
    }
    catch (error){
     
    }

  }

  next(){
    console.log(this.new)
    console.log(this.datatime)

    this.data.getdatamotel().subscribe(motel => {
      this.motelnew = motel
      console.log(this.motelnew)
      this.motelnew.typeservice = this.new;
      this.motelnew.time = this.datatime;

     
      let bill = new Bill();
      bill.payMoney = this.totalprice;
      var t = this.datatime.split(" ");
      bill.numberDatePublish = Number(t[0]);
      bill.timeChoice = this.time;

      this.motelnew.bill = bill;
      this.data.setdatamotel(this.motelnew);
    });
  
   
    
    this.router.navigateByUrl('/user/thanhtoandong');
  }

  public tinhtien(){
    console.log(this.datatime.split(" "));
    if(this.new == "Tin Hot"){
      if(this.time == "Đăng theo ngày"){
        this.t = 50000
        this.type = this.datatime.split(" ");

        this.totalprice = Number(this.type[0])*this.t;
      }
      if(this.time == "Đăng theo tuần"){
        this.t = 315000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
      if(this.time == "Đăng theo tháng"){
        this.t = 120000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
    }
    if(this.new == "Tin VIP 30"){
      if(this.time == "Đăng theo ngày"){
        this.t = 30000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
      if(this.time == "Đăng theo tuần"){
        this.t = 190000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
      if(this.time == "Đăng theo tháng"){
        this.t = 800000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
    }
    if(this.new == "Tin VIP 20"){
      if(this.time == "Đăng theo ngày"){
        this.t = 20000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
      if(this.time == "Đăng theo tuần"){
        this.t = 133000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
      if(this.time == "Đăng theo tháng"){
        this.t = 540000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
    }
    if(this.new == "Tin VIP 10"){
      if(this.time == "Đăng theo ngày"){
        this.t = 10000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
      if(this.time == "Đăng theo tuần"){
        this.t = 63000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
      if(this.time == "Đăng theo tháng"){
        this.t = 240000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
    }
    if(this.new == "Tin thường"){
      if(this.time == "Đăng theo ngày"){
        this.t = 2000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
      if(this.time == "Đăng theo tuần"){
        this.t = 12000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
      if(this.time == "Đăng theo tháng"){
        this.t = 48000
        this.type = this.datatime.split(" ");
        this.totalprice = Number(this.type[0])*this.t;
      }
    }

  }
}
