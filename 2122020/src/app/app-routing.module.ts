import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { UserComponent } from './user/user.component';
import { ElementComponent } from './element/element.component';
import { CommonModule, } from '@angular/common';
import { BrowserModule  } from '@angular/platform-browser';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { TrangChiTietComponent } from './trang-chi-tiet/trang-chi-tiet.component';
import { TrangTimKiemComponent } from './trang-tim-kiem/trang-tim-kiem.component';
import { DanhMucComponent } from './danh-muc/danh-muc.component';
import { DanhMucTinDangComponent } from './danh-muc-tin-dang/danh-muc-tin-dang.component';
import { ThongTinCoBanComponent } from './thong-tin-co-ban/thong-tin-co-ban.component';
import { ThongTinCoBanNextComponent } from './thong-tin-co-ban-next/thong-tin-co-ban-next.component';
import { ThongTinCoBanNextNextComponent } from './thong-tin-co-ban-next-next/thong-tin-co-ban-next-next.component';
import { ThongTinHinhAnhComponent } from './thong-tin-hinh-anh/thong-tin-hinh-anh.component';
import { ChonGoiTinThanhToanComponent } from './chon-goi-tin-thanh-toan/chon-goi-tin-thanh-toan.component';
import { ThanhToanDongComponent } from './thanh-toan-dong/thanh-toan-dong.component';
import { NavbarAdminComponent } from './navbar-admin/navbar-admin.component';
import { SlidebarAdminComponent } from './slidebar-admin/slidebar-admin.component';


const routes: Routes = [
  { path: 'slidebaradmin',          component: SlidebarAdminComponent },
  { path: 'navbaradmin',          component: NavbarAdminComponent },

  { path: 'quanly/thanhtoandong',          component: ThanhToanDongComponent },
  { path: 'quanly/goithanhtoan',          component: ChonGoiTinThanhToanComponent },
  { path: 'quanly/thongtinhinhanh',          component: ThongTinHinhAnhComponent },
  { path: 'quanly/thongtin3',          component: ThongTinCoBanNextNextComponent },
  { path: 'quanly/thongtin2',          component: ThongTinCoBanNextComponent },
  { path: 'quanly/thongtin1',          component: ThongTinCoBanComponent },
  { path: 'quanly/danhmuctindang',          component: DanhMucTinDangComponent },
  { path: 'quanly/danhmuc',          component: DanhMucComponent },

  { path: 'timkiem',          component: TrangTimKiemComponent },
  { path: 'chitiet',          component: TrangChiTietComponent },
  { path: 'login', component: LoginComponent },
  { path: 'user',          component: UserComponent },
  { path: 'home',          component: ElementComponent },
  


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
