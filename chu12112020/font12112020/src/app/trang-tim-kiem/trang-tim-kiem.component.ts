import { Component, Input, OnChanges, OnInit, SimpleChanges } from '@angular/core';
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

  //page
  totalRecord: Number;
  page:Number = 1;

  //load
  NAME;
  constructor(private typeservice:TypeofnewService,private route: Router,private router: ActivatedRoute,public dangtinService:DangtinService) {

   }


   async ngOnInit(): Promise<void> {
    this.router.data.subscribe(data => {
      this.name = data.kind;
    })
    console.log(this.name);
    if(this.name == "cho-thue-nha-tro"){
      this.NAME = "Cho thuê phòng trọ, nhà trọ số 1 Việt Nam";
       await this.getmotelbytype("Phòng trọ, nhà trọ");
    }
    if(this.name == "nha-cho-thue"){
      this.NAME = "Cho Thuê Nhà Nguyên Căn, Giá Rẻ, Chính Chủ, Mới Nhất 2020";
      await this.getmotelbytype("Nhà thuê nguyên căn");
    }
    if(this.name == "cho-thue-can-ho"){
      this.NAME = "Cho Thuê Căn Hộ Chung Cư Mini, Căn Hộ Dịch Vụ, Giá Rẻ - Mới Nhất 2020";
      await this.getmotelbytype("Cho thuê căn hộ");
    }
    if(this.name == "cho-thue-mat-bang"){
      this.NAME = "Cho Thuê Mặt Bằng, Cho Thuê Văn Phòng, Cửa Hàng, Kiot";
      await this.getmotelbytype("Cho thuê mặt bằng");
    }
    if(this.name == "tim-nguoi-o-ghep"){
      this.NAME = "Tìm Người Ở Ghép, Tìm Nam Ở Ghép, Tìm Nữ Ở Ghép";
      await this.getmotelbytype("Tìm người ở ghép");
    }



    //this.dangtinService.getSearchMotel().subscribe(motel => this.motelsearch = motel);
    //this.dangtinService.searchmoteluser(this.motelsearch).subscribe(getmotels => this.motels = getmotels);
  }


  linkrouter(name, id) {
    console.log(name + id);
    //this.router.navigate( [{name: name, id: id}]);
    this.route.navigate( ['/home/chitiet',name,id]);
  }

  handlePageChange(event) {
    this.page = event;
  }

  public getMotelSearch(){
    //this.dangtinService.searchmoteluser().subscribe(getcity => this.cities = getcity)
  }

  public getmotelbytype(name) {
    this.dangtinService.getmotelbytype(name).subscribe(motel => {
      this.motels = motel;
      console.log(this.motels);
      this.totalRecord = this.motels.length;
    });
  }

}
