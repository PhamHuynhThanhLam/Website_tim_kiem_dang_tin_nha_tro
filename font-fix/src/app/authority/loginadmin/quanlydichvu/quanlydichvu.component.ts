import { Component, OnInit } from '@angular/core';
import { PriceService } from '../../../serviceapits/price.service'
import { Router } from '@angular/router';
import { Serviceprice } from '../../../model/Serviceprice';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-quanlydichvu',
  templateUrl: './quanlydichvu.component.html',
  styleUrls: ['./quanlydichvu.component.css']
})
export class QuanlydichvuComponent implements OnInit {

  Serviceprice: Serviceprice[];
  constructor(private http: HttpClient,private router: Router,private priceService: PriceService) { }

  ngOnInit(): void {
    this.getServiceprices();
  }

  public getServiceprices(){
    this.priceService.getServiceprices().subscribe(getserviceprice => this.Serviceprice = getserviceprice)
  }
}
