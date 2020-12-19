import { Component, OnInit } from '@angular/core';
import { PriceService } from '../../app/serviceapits/price.service'
import { Router } from '@angular/router';
import { Serviceprice } from '../model/Serviceprice';
import { HttpClient } from '@angular/common/http';

@Component({
  selector: 'app-banggiadichvu',
  templateUrl: './banggiadichvu.component.html',
  styleUrls: ['./banggiadichvu.component.css']
})
export class BanggiadichvuComponent implements OnInit {


  Serviceprice: Serviceprice[];
  constructor(private http: HttpClient,private router: Router,private priceService: PriceService) { }

  ngOnInit(): void {
    this.getServiceprices();
  }

  public getServiceprices(){
    this.priceService.getServiceprices().subscribe(getserviceprice => this.Serviceprice = getserviceprice)
  }

}
