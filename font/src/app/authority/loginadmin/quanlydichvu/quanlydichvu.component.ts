import { Component, OnInit } from '@angular/core';
import { PriceService } from '../../../serviceapits/price.service'
import { Router } from '@angular/router';
import { Serviceprice } from '../../../model/Serviceprice';
import { HttpClient } from '@angular/common/http';
import { Bill } from 'src/app/model/Motel';

@Component({
  selector: 'app-quanlydichvu',
  templateUrl: './quanlydichvu.component.html',
  styleUrls: ['./quanlydichvu.component.css']
})
export class QuanlydichvuComponent implements OnInit {

  Serviceprice: Serviceprice[];
  EditRowID: any = "";
  Columnname : string = "";
  date = "";
  priceDate = "";
  priceMonth = "";
  priceUpTop = "";
  priceWeek = "";
  typeofnew = "";
  
  constructor(private http: HttpClient,private router: Router,private priceService: PriceService) { }

  ngOnInit(): void {

    this.getServiceprices();
  }

  public getServiceprices(){
    this.priceService.getServiceprices().subscribe(getserviceprice => this.Serviceprice = getserviceprice)
  }

  Edit(value){
    this.EditRowID = value;
    console.log();
  }

  savedata(ID){
    var id = Number(ID) - Number(1);
    console.log(id);
    var bill = new Serviceprice();
    bill.id = this.Serviceprice[id].id;
    bill.typeofnew = this.Serviceprice[id].typeofnew; 
    
    if(this.date == ""){
      bill.date = this.Serviceprice[id].date;
    }
    else{
      bill.date = this.date;
    }

    if(this.priceDate == ""){
      bill.priceDate = this.Serviceprice[id].priceDate; 
    }
    else{
      bill.priceDate = this.priceDate;  
    }

    if(this.priceMonth == ""){
       bill.priceMonth = this.Serviceprice[id].priceMonth; 
    }
    else{
      bill.priceMonth = this.priceMonth;  
    }

    if(this.priceUpTop == ""){
      bill.priceUpTop = this.Serviceprice[id].priceUpTop;
    }
    else{
      bill.priceUpTop = this.priceUpTop;
    }

    if(this.priceWeek == ""){
      bill.priceWeek = this.Serviceprice[id].priceWeek;
    }
    else{
      bill.priceWeek = this.priceWeek;
    }

    
   
    console.log(bill);
    this.priceService.updateServiceprice(bill).subscribe(update => {
      console.log(update);
      alert("Sửa thành công")
    })
  }

  update(event: any, priceDate: string)
  {
    this.priceDate = priceDate;
  }
  update1(event: any, priceWeek: string)
  {
    this.priceWeek = priceWeek;
  }
  update2(event: any, priceMonth: string)
  {
    this.priceMonth = priceMonth;
  }
  update3(event: any, priceUpTop: string)
  {
    this.priceUpTop = priceUpTop;
  }
  update4(event: any, date: string)
  {
    this.date = date;
  }
}
