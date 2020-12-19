import { Component, OnInit } from '@angular/core';
import { Bill } from '../../../model/Bill';
import { Account } from '../../../model/Account';
import { BuymoneyService } from '../../../serviceapits/buymoney.service';

@Component({
  selector: 'app-quanlynaptien',
  templateUrl: './quanlynaptien.component.html',
  styleUrls: ['./quanlynaptien.component.css']
})
export class QuanlynaptienComponent implements OnInit {
  bill: Bill[];
  billnow:Bill[];
  count: Number = 0;
  search = "";
  //page
  totalRecord: Number;
  page:Number = 1;

  constructor(private buymoneysrvice : BuymoneyService) { 
  
  }

  ngOnInit(): void {
    this.getbills();
    this.getnowbills();
    
  }

  handlePageChange(event) {
    this.page = event;
  }

  public getbills(){
    this.buymoneysrvice.getAdminBills().subscribe(data => {
      this.bill = data;
      console.log(this.bill)
      this.tongtien();
    })
  }

  public getnowbills(){
    this.buymoneysrvice.getNowsBills().subscribe(data => {
      this.billnow = data;
      console.log(this.billnow)
    })
  }

  public onsearch(){
    if(this.search == "")
    {
      this.bill = this.bill;
    }
    else{
      this.buymoneysrvice.getbillbyname(this.search).subscribe(data => {
        this.bill = data;
        console.log(this.bill)
      })
    }
   
  }

  public tongtien(){
    for(let i=0; i< this.bill.length;i++){
      this.count = Number(this.count) + Number(this.bill[i].payMoney);
    }
  }
}
