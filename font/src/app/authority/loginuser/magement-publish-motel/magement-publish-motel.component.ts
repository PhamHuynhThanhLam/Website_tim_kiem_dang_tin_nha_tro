import { Component, OnInit } from '@angular/core';
import { TypeofnewService } from '../../../services/newstype.service'
import { NewType } from '../../../model/NewType';
import { Motel } from '../../../model/Motel';
import { MotelService } from '../../../services/motel.service'
import { AuthenticationService } from '../../../services/authentication.service';
import { Account } from  '../../../model/Account';
import { Subject} from 'rxjs';

export interface Type{
  id:number;
  text:string;
}

@Component({
  selector: 'app-magement-publish-motel',
  templateUrl: './magement-publish-motel.component.html',
  styleUrls: ['./magement-publish-motel.component.css']
})
export class MagementPublishMotelComponent implements OnInit {

  nametophead = "Quản lý đăng tin"
  // Danh sách loại motel
  newTypes: NewType [];
  newType = "";
  // Danh sách trạng thái motel
  statuss:Array<Type> = [
    {id: 0, text:'Tin đang hiển thị'}, 
    {id: 1, text:'Tin hết hạn'}, 
    {id: 2, text:'Tin đang ẩn'},
  ];
  status: string= "";
  // Danh sách motel user đã đăng
  motels: Motel[];
  searchmotels: Motel[];

  //pagination
  totalRecord: Number;
  page:Number = 1;

  // Lấy data account từ localstogare
  currentAccount: Account;


  constructor(private authenticationService: AuthenticationService,private motelService: MotelService,private typeservice:TypeofnewService) { 
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    this.getMotels();
  }

  ngOnInit(): void {
    this.newType = "";
    this.status = ""
    this.getNewTypes();
  }

  public handlePageChange(event) {
    this.page = event;
  }

  public onClickSearchNewType(event: any){
    let value = event.target.value;
    var city = this.newTypes.find(a => a.id == value);
    this.newType = city.name;
    if(this.status == ""){
      this.motels = this.searchmotels.filter(motel => motel.detail.typeofnew.name == this.newType);
    }
    else{
      this.motels = this.searchmotels.filter(motel => motel.status == this.status && motel.detail.typeofnew.name == this.newType);
    }
  }

  public getNewTypes(){
    this.typeservice.getTypes().subscribe(gettypes => {
      this.newTypes = gettypes;
      console.log(this.newTypes);
    })

  }

  public getMotels(){
    this.motelService.getmotelbyuser(this.currentAccount.user.id).subscribe(getmotel => {
      this.motels = getmotel
      this.searchmotels = getmotel
      console.log(this.motels);
      this.totalRecord = this.motels.length;
    })
  }

  public onChangeStatus(event: any)
  {
    let value = event.target.value;
    var name = this.statuss[value].text.toString();
    this.status = name;
   
    if(this.newType == ""){
      this.motels = this.searchmotels.filter(motel => motel.status == this.status);
    }
    else{
      this.motels = this.searchmotels.filter(motel => motel.status == this.status && motel.detail.typeofnew.name == this.newType);
    }
  }

}
