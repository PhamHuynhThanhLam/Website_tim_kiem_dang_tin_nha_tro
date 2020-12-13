import { Component, OnInit } from '@angular/core';
import { TypeofnewService } from '../../serviceapits/typeofnew.service'
import { Typeofnew } from '../../model/Typeofnew';
import { Input } from '@angular/core';
import { Router } from '@angular/router';
import { DangtinService } from '../../serviceapits/dangtin.service';
import { Motel } from '../../model/Motel';

@Component({
  selector: 'app-danh-muc',
  templateUrl: './danh-muc.component.html',
  styleUrls: ['./danh-muc.component.css']
})
export class DanhMucComponent implements OnInit {

  public types = new Array<Typeofnew>();

  public typeof:Typeofnew;
  constructor(private router: Router,private typeservice:TypeofnewService,public data:DangtinService) { }

  ngOnInit(): void {
    this.getTypes();
  }

  public clicktype = async (type) => {
    this.typeof = type;
    console.log(this.typeof)
    this.data.setProfileObs(this.typeof);
    this.router.navigateByUrl('/user/thongtin1');
  }

  public getTypes = async () => {
    this.typeservice.getTypes().subscribe(gettypes => this.types = gettypes);
  }
}
