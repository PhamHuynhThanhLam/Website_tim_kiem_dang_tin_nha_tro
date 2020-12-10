import { Component, Input, OnInit } from '@angular/core';
import { DangtinService } from '../serviceapits/dangtin.service';
import { Motel,Image } from '../model/Motel';
import { Router, ActivatedRoute } from '@angular/router'
import { Location } from '@angular/common'
import { Typeofnew } from '../model/Typeofnew';
import { TypeofnewService } from '../serviceapits/typeofnew.service'

@Component({
  selector: 'app-trang-tim-kiem',
  templateUrl: './trang-tim-kiem.component.html',
  styleUrls: ['./trang-tim-kiem.component.css']
})
export class TrangTimKiemComponent implements OnInit {

  motelsearch: Motel;
  @Input() motels:Motel[];
  types: Typeofnew[];
  name:string;
  constructor(private typeservice:TypeofnewService,private router: ActivatedRoute,public dangtinService:DangtinService) { }

  ngOnInit(): void {
    this.dangtinService.currentMessage.subscribe(message => this.name = message);
    console.log(this.name);
    if(this.name == "cho-thue-nha-tro"){
      this.getmotelbytype("Phòng trọ, nhà trọ");
    }
    if(this.name == "nha-cho-thue"){
      this.getmotelbytype("Nhà thuê nguyên căn");
    }
    if(this.name == "cho-thue-can-ho"){
      this.getmotelbytype("Cho thuê căn hộ");
    }
    if(this.name == "cho-thue-mat-bang"){
      this.getmotelbytype("Cho thuê mặt bằng");
    }
    if(this.name == "tim-nguoi-o-ghep"){
      this.getmotelbytype("Tìm người ở ghép");
    }
    
    //this.dangtinService.getSearchMotel().subscribe(motel => this.motelsearch = motel);
    //this.dangtinService.searchmoteluser(this.motelsearch).subscribe(getmotels => this.motels = getmotels);
  }

  public getMotelSearch(){
    //this.dangtinService.searchmoteluser().subscribe(getcity => this.cities = getcity)
  }

  public getmotelbytype(name){
    this.dangtinService.getmotelbytype(name).subscribe(motel => this.motels = motel);
    console.log(this.motels);
  }

}
