import { Input } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DangtinService } from '../../../../serviceapits/dangtin.service';
import { Motel } from '../../../../model/Motel';
import { Detail } from '../../../../model/Detail';

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

  public pricemin: Float32Array;
  public aremin: string;

  public directs:Array<Direct> = [
    {id: 1, text:'Đông'},
    {id: 2, text:'Tây'},
    {id: 3, text:'Nam'},
    {id: 4, text:'Bắc'},
    {id: 5, text:'Đông Bắc'},
    {id: 6, text:'Đông Nam'},
    {id: 7, text:'Tây Bắc'},
    {id: 8, text:'Tây Nam'},
  ];
  public direct: string;


  public legals:Array<Legal> = [
    {id: 1, text:'Sổ đỏ'},
    {id: 2, text:'Sổ hồng'},
    {id: 3, text:'Sổ trắng'},
    {id: 4, text:'Giấy chứng nhận quyền sở hữu'},
    {id: 5, text:'Giấy tờ hợp lệ'},
    {id: 6, text:'Giấy phép xây dựng'},
    {id: 7, text:'Giấy phép kinh doanh'},
    {id: 8, text:'Giấy viết tay'},
    {id: 9, text:'Đang hơp thức hóa'},
    {id: 10, text:'Chưa xác định'},
  ];
  public legal: string;

  public title: string;
  public description: string;
  
  constructor(private router: Router,public data:DangtinService) { }

  ngOnInit(): void {
    this.direct = this.directs[0].text.toString();
    this.legal = this.legals[0].text.toString();
  }

  onChange(event)
  {
    let value = event.target.value;
    var name = this.directs[value].text.toString();
    console.log(this.directs[value].text)
    this.direct = name;
  }

  onChange2(event)
  {
    let value = event.target.value;
    var name = this.legals[value].text.toString();
    this.legal = name;
  }

  next(){
    let motelnew = new Motel();
    this.data.getdatamotel().subscribe(motel => motelnew = motel);
    
    motelnew.price = this.pricemin;
    motelnew.areaZone = this.aremin;
    let detail = new Detail();
    detail.director = this.direct;
    detail.legal = this.legal;
    motelnew.detail = detail;
    motelnew.title = this.title;
    motelnew.description = this.description;

    this.data.setdatamotel(motelnew);
    this.router.navigateByUrl('/user/thongtin3');
  }
}
