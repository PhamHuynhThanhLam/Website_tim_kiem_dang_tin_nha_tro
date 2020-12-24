import { Input } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MotelService } from '../../../../services/motel.service';
import { Motel } from '../../../../model/Motel';
import { Detail } from '../../../../model/Detail';
import { BehaviorSubjectClass } from '../../../../services/behaviorsubject'

export interface Direct{
  id:number;
  text:string;
}

export interface Legal{
  id:number;
  text:string;
}


@Component({
  selector: 'app-thong-tin-co-ban-next',
  templateUrl: './thong-tin-co-ban-next.component.html',
  styleUrls: ['./thong-tin-co-ban-next.component.css']
})


export class ThongTinCoBanNextComponent implements OnInit {

  motelprevous:Motel;
  priceMotel: Float32Array;
  areaMotel: string;

  directs:Array<Direct> = [
    {id: 0, text:'Đông'},
    {id: 1, text:'Tây'},
    {id: 2, text:'Nam'},
    {id: 3, text:'Bắc'},
    {id: 4, text:'Đông Bắc'},
    {id: 5, text:'Đông Nam'},
    {id: 6, text:'Tây Bắc'},
    {id: 7, text:'Tây Nam'},
  ];
  direct: string;


  legals:Array<Legal> = [
    {id: 0, text:'Sổ đỏ'},
    {id: 1, text:'Sổ hồng'},
    {id: 2, text:'Sổ trắng'},
    {id: 3, text:'Giấy chứng nhận quyền sở hữu'},
    {id: 4, text:'Giấy tờ hợp lệ'},
    {id: 5, text:'Giấy phép xây dựng'},
    {id: 6, text:'Giấy phép kinh doanh'},
    {id: 7, text:'Giấy viết tay'},
    {id: 8, text:'Đang hơp thức hóa'},
    {id: 9, text:'Chưa xác định'},
  ];
  legal: string;

  title: string;
  description: string;

  typePriceMotels:Array<Legal> = [
    {id: 0, text:'đồng/tháng'},
    {id: 1, text:'triệu/tháng'},
  ];
  typePriceMotel: string;
  
  constructor(private behaviorSubjectClass: BehaviorSubjectClass,private router: Router,public motelService:MotelService) {
    this.behaviorSubjectClass.getDataMotel().subscribe(motel => {
      this.motelprevous = motel;
      if(this.motelprevous){
        this.priceMotel = this.motelprevous.price;
        this.areaMotel = this.motelprevous.areaZone;
        this.title = this.motelprevous.title;
        this.description = this.motelprevous.description;
      }
    });
   }

  ngOnInit(): void {
    this.direct = this.directs[0].text.toString();
    this.legal = this.legals[0].text.toString();
  }

  public onChangeTypePriceMote(event){
    let value = event.target.value;
    var name = this.typePriceMotels[value].text.toString();
    console.log(this.typePriceMotels[value].text)
    this.typePriceMotel = name;
  }

  public onChangeDirect(event)
  {
    let value = event.target.value;
    var name = this.directs[value].text.toString();
    console.log(this.directs[value].text)
    this.direct = name;
  }

  public onChangeLegal(event)
  {
    let value = event.target.value;
    var name = this.legals[value].text.toString();
    this.legal = name;
  }

  public next(){
    let motelnew = new Motel();
    this.behaviorSubjectClass.getDataMotel().subscribe(motel => motelnew = motel);
    motelnew.price = this.priceMotel;
    motelnew.areaZone = this.areaMotel;
    motelnew.priceType = this.typePriceMotel;
    motelnew.areaZoneType = "m²";
    let detail = new Detail();
    detail.director = this.direct;
    detail.legal = this.legal;
    motelnew.detail = detail;
    motelnew.title = this.title;
    motelnew.description = this.description;

    this.behaviorSubjectClass.setDataMotel(motelnew);
    this.router.navigateByUrl('/user/thong-tin-chi-tiet-nha-tro');
  }

  public prevous(){
    this.router.navigateByUrl('/user/thong-tin-vi-tri');
  }
}
