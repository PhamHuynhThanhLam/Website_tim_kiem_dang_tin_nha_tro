import { Input } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DangtinService } from '../../../../serviceapits/dangtin.service';
import { Motel } from '../../../../model/Motel';
import { Detail } from '../../../../model/Detail';

@Component({
  selector: 'app-thong-tin-co-ban-next-next',
  templateUrl: './thong-tin-co-ban-next-next.component.html',
  styleUrls: ['./thong-tin-co-ban-next-next.component.css']
})
export class ThongTinCoBanNextNextComponent implements OnInit {

  public typelive: string;
  public numberBath: string;
  public numberLiving: string;

  btnDisabled1 = true;
  btnDisabled2 = true;
  constructor(private router: Router,public data:DangtinService) { }

  ngOnInit(): void {
    this.numberBath = "0";
    this.numberLiving = "0";
  }

  Up1()
  {
    this.numberBath = (Number(this.numberBath) + 1).toString();
    this.btnDisabled1 = false;
  }

  Down1()
  {
    this.numberBath = (Number(this.numberBath) - 1).toString();
    if(Number(this.numberBath) == 0){
      this.btnDisabled1 = true;
    }
    
  }

  Up2()
  {
    this.numberLiving = (Number(this.numberLiving) + 1).toString();
    this.btnDisabled2 = false;
  }

  Down2()
  {
    this.numberLiving = (Number(this.numberLiving) - 1).toString();
    if(Number(this.numberLiving) == 0){
      this.btnDisabled2 = true;
    }
    
  }

  next(){
    let motelnew = new Motel();
    this.data.getdatamotel().subscribe(motel => motelnew = motel);
    let detail = new Detail();
    detail.typelive = this.typelive;
    detail.numberBath = Number(this.numberBath);
    detail.numberLiving = Number(this.numberLiving);
    motelnew.detail = detail;
    this.data.setdatamotel(motelnew);
    this.router.navigateByUrl('/user/thongtinhinhanh');
  }
}
