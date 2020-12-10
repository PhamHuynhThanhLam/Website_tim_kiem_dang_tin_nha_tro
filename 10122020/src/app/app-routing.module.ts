import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
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


const routes: Routes = [

  { path: 'pal',          component: PaypalComponent },
  //{ path: 'slidebaradmin',          component: SlidebarAdminComponent },
  //{ path: 'navbaradmin',          component: NavbarAdminComponent },

  //{ path: 'quanly/thanhtoandong',          component: ThanhToanDongComponent },
  //{ path: 'quanly/goithanhtoan',          component: ChonGoiTinThanhToanComponent },
  //{ path: 'quanly/thongtinhinhanh',          component: ThongTinHinhAnhComponent },
  //{ path: 'quanly/thongtin3',          component: ThongTinCoBanNextNextComponent },
  //{ path: 'quanly/thongtin2',          component: ThongTinCoBanNextComponent },
  //{ path: 'quanly/thongtin1',          component: ThongTinCoBanComponent },
  //{ path: 'quanly/danhmuctindang',          component: DanhMucTinDangComponent },
  //{ path: 'quanly/danhmuc',          component: DanhMucComponent },

  //{ path: 'timkiem',          component: TrangTimKiemComponent },
  //{ path: 'chitiet',          component: TrangChiTietComponent },
  //{ path: 'login', component: LoginComponent },

  //{ path: 'user',          component: UserComponent },

  //{ path: 'home',          component: ElementComponent },

  {  
    path: 'admin',          component: LoginadminComponent ,
    children:[
      { path: '',          component: UserComponent }
    ] 
  },

  {  
    path: 'user',          component: LoginuserComponent ,
    children:[
      { path: '',          component: UserComponent },
      { path: 'thanhtoandong',          component: ThanhToanDongComponent },
      { path: 'goithanhtoan',          component: ChonGoiTinThanhToanComponent },
      { path: 'thongtinhinhanh',          component: ThongTinHinhAnhComponent },
      { path: 'thongtin3',          component: ThongTinCoBanNextNextComponent },
      { path: 'thongtin2',          component: ThongTinCoBanNextComponent },
      { path: 'thongtin1',          component: ThongTinCoBanComponent },
      { path: 'danhmuctindang',          component: DanhMucTinDangComponent },
      { path: 'danhmuc',          component: DanhMucComponent }
    ] 
  },

  {  
    path: 'home',          component: NotloginComponent ,
    children:[
      { path: '',          component: ElementComponent },
      { path: ':name',          component: TrangTimKiemComponent },
      ///{ path: 'nha-cho-thue',          component: TrangTimKiemComponent },
      //{ path: 'cho-thue-can-ho',          component: TrangTimKiemComponent },
      //{ path: 'cho-thue-mat-bang',          component: TrangTimKiemComponent },
      //{ path: 'tim-nguoi-o-ghep-cap',          component: TrangTimKiemComponent },
      { path: 'chitiet',          component: TrangChiTietComponent }
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
