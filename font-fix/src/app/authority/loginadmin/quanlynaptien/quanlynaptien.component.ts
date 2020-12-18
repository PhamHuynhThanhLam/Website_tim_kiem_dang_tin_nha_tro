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
    })
  }

  public getnowbills(){
    this.buymoneysrvice.getNowsBills().subscribe(data => {
      this.billnow = data;
      console.log(this.billnow)
    })
  }
}
