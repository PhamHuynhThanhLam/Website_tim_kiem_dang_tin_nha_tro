import { Component, OnInit } from '@angular/core';
import { TypeofnewService } from '../../../services/newstype.service'
import { NewType } from '../../../model/NewType';
import { Motel } from '../../../model/Motel';
import { MotelService } from '../../../services/motel.service'
import { AuthenticationService } from '../../../services/authentication.service';
import { Account } from  '../../../model/Account';
import {Observable, Subject} from 'rxjs';
import {startWith, map, debounce ,distinctUntilChanged,switchMap} from 'rxjs/operators';
import { DialogDetailMotelPublishComponent } from '../dialog-detail-motel-publish/dialog-detail-motel-publish.component';
import { MatDialog } from '@angular/material/dialog';

export interface Type{
  id:number;
  text:string;
}

@Component({
  selector: 'app-admin-publish',
  templateUrl: './admin-publish.component.html',
  styleUrls: ['./admin-publish.component.css']
})
export class AdminPublishComponent implements OnInit {

  nametophead = "Quản lý đăng tin"
  newTypes: NewType [];
  newType = "";

  statuss:Array<Type> = [
    {id: 0, text:'Tất cả'}, 
    {id: 1, text:'Tin đã duyệt'}, 
    {id: 2, text:'Tin chưa duyệt'},
  ];
  status: string= "";

  motels: Motel[];
  searchmotels: Motel[];

  //pagination
  totalRecord: Number;
  page:Number = 1;

  currentAccount: Account;

  constructor(public dialog: MatDialog,private authenticationService: AuthenticationService,private motelService: MotelService,private typeservice:TypeofnewService) { 
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    this.getMotels();
  }

  ngOnInit(): void {
    this.newType = "Tất cả";
    this.status = "Tất cả"
    this.getTypes();
  }

  public handlePageChange(event) {
    this.page = event;
  }

  public onChangeNewType(event: any){
    let value = event.target.value;
    var city = this.newTypes.find(a => a.id == value);
    this.newType = city.name;
    console.log(this.status)
    console.log(this.newType)
    if((this.status == "Tất cả" && this.newType != "Tất cả") || this.status == "Tất cả" && this.newType != "Tất cả"){
      this.motels = this.searchmotels.filter(motel => motel.detail.typeofnew.name == this.newType);
    }
    else if(this.status == "Tất cả" && this.newType == "Tất cả"){
      this.motels = this.searchmotels;
    }
    else if(this.status != "Tất cả" && this.newType == "Tất cả"){
      this.motels = this.searchmotels.filter(motel => motel.detail.typeofnew.name == this.newType);
    }
    else{
      if(this.status == "Tin đã duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.detail.typeofnew.name == this.newType && motel.verifyAdmin == true);
      }
      if(this.status == "Tin chưa duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.detail.typeofnew.name == this.newType && motel.verifyAdmin == false);
      }
    }
  }

  public getTypes(){
    this.typeservice.getTypes().subscribe(gettypes => {
      this.newTypes = gettypes;
      console.log(this.newTypes);
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

  public onChangeStatus(event: any)
  {
    let value = event.target.value;
    var name = this.statuss[value].text.toString();
    this.status = name;
    console.log(this.status)
    console.log(this.newType)
    if((this.newType == "Tất cả" && this.status != "Tất cả") || (this.status == "Tất cả" && this.newType != "Tất cả")){
      if(this.status == "Tin đã duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verifyAdmin == true);
      }
      if(this.status == "Tin chưa duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verifyAdmin == false);
      }
    }
    else if(this.status == "Tất cả" && this.newType == "Tất cả"){
      this.motels = this.searchmotels;
    }
    else if(this.status != "Tất cả" && this.newType == "Tất cả"){
      this.motels = this.searchmotels.filter(motel => motel.detail.typeofnew.name == this.newType);
    }
    else{
      if(this.status == "Tin đã duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verifyAdmin == true && motel.detail.typeofnew.name == this.newType);
      }
      if(this.status == "Tin chưa duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verifyAdmin == false && motel.detail.typeofnew.name == this.newType);
      }
    }

  }

  /*onduyettin(motel:Motel){
    var motelupdate = new Motel();
    motelupdate = motel;
    motelupdate.verifyAdmin = true;
    motelupdate.status = "Tin đang hiển thị";
    console.log(motelupdate);
    this.motelService.updateMotel(motelupdate).subscribe(update => {
      console.log(update);
    })
  }*/

  openDialog(motel:Motel): void {
    const dialogRef = this.dialog.open(DialogDetailMotelPublishComponent, {
      direction: "ltr",
      width: '1000px',
      height:'600px',
      data: motel
    });

    dialogRef.afterClosed().subscribe((result: Motel) => {
      if (result)
      {
        console.log('The dialog was closed');
        console.log(result);
        //if (!this.isEdit) this.createNewExam(result);
        //else this.updateExam(result);
      }
        
    });
  }

}
