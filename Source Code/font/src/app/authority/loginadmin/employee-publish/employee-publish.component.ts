import { Component, OnInit } from '@angular/core';
import { TypeofnewService } from '../../../services/newstype.service'
import { NewType } from '../../../model/NewType';
import { Motel } from '../../../model/Motel';
import { MotelService } from '../../../services/motel.service'
import { AuthenticationService } from '../../../services/authentication.service';
import { Account } from  '../../../model/Account';
import { Observable, Subject } from 'rxjs';
import { startWith, map, debounce ,distinctUntilChanged,switchMap } from 'rxjs/operators';
import { DialogDetailMotelPublishComponent } from '../dialog-detail-motel-publish/dialog-detail-motel-publish.component';
import { MatDialog } from '@angular/material/dialog';

export interface Type{
  id:number;
  text:string;
}

@Component({
  selector: 'app-employee-publish',
  templateUrl: './employee-publish.component.html',
  styleUrls: ['./employee-publish.component.css']
})
export class EmployeePublishComponent implements OnInit {

  nametophead = "Quản lý đăng tin"

  newtypes: NewType[];
  newtype = "";

  statuss:Array<Type> = [
    {id: 0, text:'Tin đã duyệt'}, 
    {id: 1, text:'Tin chưa duyệt'}
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
    this.newtype = "";
    this.status = ""
    this.getTypes();
  }

  public handlePageChange(event) {
    this.page = event;
  }

  public onChangeNewType(event: any){
    let value = event.target.value;
    var city = this.newtypes.find(a => a.id == value);
    this.newtype = city.name;
    console.log(this.newtype)
    if(this.status == ""){
      this.motels = this.searchmotels.filter(motel => motel.detail.typeofnew.name == this.newtype);
    }
    else{
      if(this.status == "Tin đã duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verify == true && motel.detail.typeofnew.name == this.newtype);
        console.log(this.motels)
      }
      if(this.status == "Tin chưa duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verify == false && motel.detail.typeofnew.name == this.newtype);
        console.log(this.motels)
      }
    }
  }

  public getTypes(){
    this.typeservice.getTypes().subscribe(gettypes => {
      this.newtypes = gettypes;
      console.log(this.newtypes);
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
   
    if(this.newtype == ""){
      if(this.status == "Tin đã duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verify == true);
        console.log(this.motels)
      }
      if(this.status == "Tin chưa duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verify == false);
        console.log(this.motels)
      }
    }
    else{
      if(this.status == "Tin đã duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verify == true && motel.detail.typeofnew.name == this.newtype);
        console.log(this.motels)
      }
      if(this.status == "Tin chưa duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verify == false && motel.detail.typeofnew.name == this.newtype);
        console.log(this.motels)
      }
    }
    

  }

  /*onduyettin(){
    var motelupdate = new Motel();
    motelupdate = motel;
    motelupdate.verify = true;
    console.log(motelupdate);
    this.motelService.updateMotel(motelupdate).subscribe(update => {
      console.log(update);
    })
  }*/

  openDialog(motel:Motel): void {
    const dialogRef = this.dialog.open(DialogDetailMotelPublishComponent, {
      direction: "ltr",
      width: '1000px',
      height:'2000px',
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
