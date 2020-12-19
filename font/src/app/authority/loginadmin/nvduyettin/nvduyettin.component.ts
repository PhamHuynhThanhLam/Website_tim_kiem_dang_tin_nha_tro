import { Component, OnInit } from '@angular/core';
import { TypeofnewService } from '../../../serviceapits/typeofnew.service'
import { Typeofnew } from '../../../model/Typeofnew';
import { Motel, User } from '../../../model/Motel';
import { DangtinService } from '../../../serviceapits/dangtin.service'
import { AuthenticationService } from '../../../serviceapits/authentication.service';
import { Account } from  '../../../model/Account';
import {Observable, Subject} from 'rxjs';
import {startWith, map, debounce ,distinctUntilChanged,switchMap} from 'rxjs/operators';

export interface Type{
  id:number;
  text:string;
}

@Component({
  selector: 'app-nvduyettin',
  templateUrl: './nvduyettin.component.html',
  styleUrls: ['./nvduyettin.component.css']
})
export class NvduyettinComponent implements OnInit {

  searchname = "Quản lý đăng tin"
  public types = new Array<Typeofnew>();
  public type = "";

  public statuss:Array<Type> = [
    {id: 0, text:'Tin đang hiển thị'}, 
    {id: 1, text:'Tin hết hạn'}, 
    {id: 2, text:'Tin đang ẩn'},
  ];
  public status: string= "";

  motels: Motel[];
  searchmotels: Motel[];
  private searchObject = new Subject<string>();

  updatestatus;
  //pagination
  totalRecord: Number;
  page:Number = 1;

  currentAccount: Account;
  constructor( private authenticationService: AuthenticationService,private motelService: DangtinService,private typeservice:TypeofnewService) { 
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    this.getMotels();
  }

  ngOnInit(): void {
    this.getTypes();
  }

  handlePageChange(event) {
    this.page = event;
  }

  search(searchstring:string):void{
    console.log(`searchstring = ${searchstring}`)
    this.searchObject.next(searchstring)
  }

  public clicktype(event: any){
    let value = event.target.value;
    var city = this.types.find(a => a.id == value);
    this.type = city.name;
    this.motels = this.searchmotels.filter(motel => motel.detail.typeofnew.name == this.type);
  }

  public getTypes(){
    this.typeservice.getTypes().subscribe(gettypes => {
      this.types = gettypes;
      console.log(this.types);
    })

  }

  public getMotels(){
    this.motelService.getmoteladmin().subscribe(getmotel => {
      this.motels = getmotel
      this.searchmotels = getmotel
      console.log(this.motels);
      this.totalRecord = this.motels.length;
    })
  }

  onChange(event: any)
  {
    let value = event.target.value;
    var name = this.statuss[value].text.toString();
    this.status = name;
    this.motels = this.searchmotels.filter(motel => motel.status == this.status);
    console.log(this.motels)
  }

  onduyettin(motel:Motel){
    var motelupdate = new Motel();
    motelupdate = motel;
    motelupdate.verify = true;
    console.log(motelupdate);
    this.motelService.updateMotel(motelupdate).subscribe(update => {
      console.log(update);
    })
  }
}
