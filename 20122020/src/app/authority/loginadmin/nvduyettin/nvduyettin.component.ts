import { Component, OnInit } from '@angular/core';
import { TypeofnewService } from '../../../serviceapits/typeofnew.service'
import { Typeofnew } from '../../../model/Typeofnew';
import { Motel, User } from '../../../model/Motel';
import { DangtinService } from '../../../serviceapits/dangtin.service'
import { AuthenticationService } from '../../../serviceapits/authentication.service';
import { Account } from  '../../../model/Account';
import { Observable, Subject } from 'rxjs';
import { startWith, map, debounce ,distinctUntilChanged,switchMap } from 'rxjs/operators';
import { DialogmotelduyettinComponent } from '../dialogmotelduyettin/dialogmotelduyettin.component';
import { MatDialog } from '@angular/material/dialog';

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
    {id: 0, text:'Tin đã duyệt'}, 
    {id: 1, text:'Tin chưa duyệt'}
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
  constructor(public dialog: MatDialog,private authenticationService: AuthenticationService,private motelService: DangtinService,private typeservice:TypeofnewService) { 
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
    this.getMotels();
  }

  ngOnInit(): void {
    this.type = "";
    this.status = ""
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
    console.log(this.type)
    if(this.status == ""){
      this.motels = this.searchmotels.filter(motel => motel.detail.typeofnew.name == this.type);
    }
    else{
      if(this.status == "Tin đã duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verify == true && motel.detail.typeofnew.name == this.type);
        console.log(this.motels)
      }
      if(this.status == "Tin chưa duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verify == false && motel.detail.typeofnew.name == this.type);
        console.log(this.motels)
      }
    }
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
   
    if(this.type == ""){
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
        this.motels = this.searchmotels.filter(motel => motel.verify == true && motel.detail.typeofnew.name == this.type);
        console.log(this.motels)
      }
      if(this.status == "Tin chưa duyệt"){
        this.motels = this.searchmotels.filter(motel => motel.verify == false && motel.detail.typeofnew.name == this.type);
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
    const dialogRef = this.dialog.open(DialogmotelduyettinComponent, {
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
