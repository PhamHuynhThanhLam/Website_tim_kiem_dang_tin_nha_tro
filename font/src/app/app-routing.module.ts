import { NgModule } from '@angular/core';
import { Routes, RouterModule, PreloadAllModules  } from '@angular/router';
import { UserComponent } from './user/user.component';
import { ElementComponent } from './element/element.component';
import { CommonModule, } from '@angular/common';
import { BrowserModule  } from '@angular/platform-browser';
import { LoginComponent } from './login/login.component';
import { TrangChiTietComponent } from './trang-chi-tiet/trang-chi-tiet.component';
import { TrangTimKiemComponent } from './trang-tim-kiem/trang-tim-kiem.component';
import { DanhMucComponent } from './Dangtin/danh-muc/danh-muc.component';
import { DanhMucTinDangComponent } from './Dangtin/danh-muc-tin-dang/danh-muc-tin-dang.component';
import { ThongTinCoBanComponent } from './Dangtin/thong-tin-co-ban/thong-tin-co-ban.component';
import { ThongTinCoBanNextComponent } from './Dangtin/thong-tin-co-ban-next/thong-tin-co-ban-next.component';
import { ThongTinCoBanNextNextComponent } from './Dangtin/thong-tin-co-ban-next-next/thong-tin-co-ban-next-next.component';
import { ThongTinHinhAnhComponent } from './Dangtin/thong-tin-hinh-anh/thong-tin-hinh-anh.component';
import { ChonGoiTinThanhToanComponent } from './Dangtin/chon-goi-tin-thanh-toan/chon-goi-tin-thanh-toan.component';
import { ThanhToanDongComponent } from './thanh-toan-dong/thanh-toan-dong.component';


import { LoginadminComponent } from './authority/loginadmin/loginadmin.component';
import { LoginuserComponent } from './authority/loginuser/loginuser.component';
import { NotloginComponent } from './authority/notlogin/notlogin.component';

import { PaypalComponent } from './paypal/paypal.component';
import { ProfileuserComponent } from './authority/loginuser/profileuser/profileuser.component';
import { TindadangComponent } from './authority/loginuser/tindadang/tindadang.component';

import { TindaliveComponent } from '../app/authority/loginuser/tindalive/tindalive.component';
import { LichsugiaodichComponent } from '../app/authority/loginuser/lichsugiaodich/lichsugiaodich.component';
import { LichsuthanhtoanComponent } from '../app/authority/loginuser/lichsuthanhtoan/lichsuthanhtoan.component';
import { BanggiadichvuComponent } from '../app/authority/loginuser/banggiadichvu/banggiadichvu.component';
import { TrogiupComponent } from '../app/authority/loginuser/trogiup/trogiup.component';
import { QuanlydangtinComponent } from '../app/authority/loginuser/quanlydangtin/quanlydangtin.component';
import { QuanlynaptienComponent } from '../app/authority/loginadmin/quanlynaptien/quanlynaptien.component';

const routes: Routes = [

  { path: 'pal',          component: PaypalComponent },
  {
    path: 'admin',          component: LoginadminComponent ,
    children:[
      { path: '',          component: UserComponent },
      { path: 'quanlynaptien',          component: QuanlynaptienComponent },
    ]
  },

  {
    path: 'user',          component: LoginuserComponent ,
    children:[
      { path: '',          component: UserComponent },
      { path: 'quanlydangtin',          component: QuanlydangtinComponent },
      { path: 'thanhtoandong',          component: ThanhToanDongComponent },
      { path: 'goithanhtoan',          component: ChonGoiTinThanhToanComponent },
      { path: 'thongtinhinhanh',          component: ThongTinHinhAnhComponent },
      { path: 'thongtin3',          component: ThongTinCoBanNextNextComponent },
      { path: 'thongtin2',          component: ThongTinCoBanNextComponent },
      { path: 'thongtin1',          component: ThongTinCoBanComponent },
      { path: 'danhmuctindang',          component: DanhMucTinDangComponent },
      { path: 'danhmuc',          component: DanhMucComponent },
      { path: 'thong-tin-ca-nhan',          component: ProfileuserComponent },
      { path: 'tin-da-dang',          component: TindadangComponent },
      { path: 'tin-da-live',          component: TindaliveComponent },
      { path: 'lich-su-giao-dich',          component: LichsugiaodichComponent },
      { path: 'lich-su-thanh-toan',          component: LichsuthanhtoanComponent },
      { path: 'bang-gia-dich-vu',          component: BanggiadichvuComponent },
      { path: 'tro-giup',          component: TrogiupComponent }
    ]
  },

  {
    path: 'home',          component: NotloginComponent ,
    children:[
      { path: '',          component: ElementComponent },
      { path: 'cho-thue-nha-tro',          component: TrangTimKiemComponent, data:{kind: 'cho-thue-nha-tro'} },
      { path: 'nha-cho-thue',          component: TrangTimKiemComponent , data:{kind: 'nha-cho-thue'}},
      { path: 'cho-thue-can-ho',          component: TrangTimKiemComponent , data:{kind: 'cho-thue-can-ho'}},
      { path: 'cho-thue-mat-bang',          component: TrangTimKiemComponent , data:{kind: 'cho-thue-mat-bang'}},
      { path: 'tim-nguoi-o-ghep-cap',          component: TrangTimKiemComponent , data:{kind: 'tim-nguoi-o-ghep-cap'}},
      { path: 'chitiet/:name/:id',          component: TrangChiTietComponent }
    ]
  },
  { path: 'login', component: LoginComponent },
  { path: '', redirectTo: 'home', pathMatch: 'full' },
];

@NgModule({
  imports: [
    CommonModule,
    BrowserModule,
    RouterModule.forRoot(routes)],
  exports: [RouterModule]
})
export class AppRoutingModule { }
