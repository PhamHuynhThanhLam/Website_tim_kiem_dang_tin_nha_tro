import { BrowserModule } from '@angular/platform-browser';
import { RouterModule } from '@angular/router';
import { NgModule } from '@angular/core';
import { OwlModule } from 'ngx-owl-carousel';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';

//Gán service
import { HttpClientModule } from '@angular/common/http';

//Use ngModel
import { FormsModule } from '@angular/forms';

import { LayoutComponent } from './layout/layout.component';
import { ElementComponent } from './element/element.component';
import { DanhMucComponent } from './danh-muc/danh-muc.component';
import { TrangTimKiemComponent } from './trang-tim-kiem/trang-tim-kiem.component';
import { DanhMucTinDangComponent } from './danh-muc-tin-dang/danh-muc-tin-dang.component';
import { ThongTinCoBanComponent } from './thong-tin-co-ban/thong-tin-co-ban.component';
import { ThongTinCoBanNextComponent } from './thong-tin-co-ban-next/thong-tin-co-ban-next.component';
import { ThongTinCoBanNextNextComponent } from './thong-tin-co-ban-next-next/thong-tin-co-ban-next-next.component';
import { ThongTinHinhAnhComponent } from './thong-tin-hinh-anh/thong-tin-hinh-anh.component';
import { ChonGoiTinThanhToanComponent } from './chon-goi-tin-thanh-toan/chon-goi-tin-thanh-toan.component';
import { TrangChiTietComponent } from './trang-chi-tiet/trang-chi-tiet.component';
import { UserComponent } from './user/user.component';
import { UserSliderComponent } from './shared/user-slider/user-slider.component';
import { FooterComponent } from './shared/footer/footer.component';
import { NavbarComponent } from './shared/navbar/navbar.component';
import { HeaderComponent } from './shared/header/header.component';
import { ThanhToanDongComponent } from './thanh-toan-dong/thanh-toan-dong.component';
import { LoginComponent } from './login/login.component';
import { RegisterComponent } from './register/register.component';
import { ChartComponent } from './chart/chart.component';
import { DashboardComponent } from './dashboard/dashboard.component';
import { NavbarAdminComponent } from './navbar-admin/navbar-admin.component';
import { SlidebarAdminComponent } from './slidebar-admin/slidebar-admin.component';


import { AngularFireModule } from '@angular/fire';
import { AngularFirestoreModule } from '@angular/fire/firestore';
import { AngularFireAuthModule } from '@angular/fire/auth';
import { environment } from '../environments/environment';


@NgModule({
  declarations: [
    AppComponent,
    LayoutComponent,
    ElementComponent,
    DanhMucComponent,
    TrangTimKiemComponent,
    DanhMucTinDangComponent,
    ThongTinCoBanComponent,
    ThongTinCoBanNextComponent,
    ThongTinCoBanNextNextComponent,
    ThongTinHinhAnhComponent,
    ChonGoiTinThanhToanComponent,
    TrangChiTietComponent,
    UserComponent,
    UserSliderComponent,
    FooterComponent,
    NavbarComponent,
    HeaderComponent,
    ThanhToanDongComponent,
    LoginComponent,
    RegisterComponent,
    ChartComponent,
    DashboardComponent,
    NavbarAdminComponent,
    SlidebarAdminComponent
  ],
  imports: [
    BrowserModule,
    RouterModule,
    AppRoutingModule,
    OwlModule,
    FormsModule,
    HttpClientModule,
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFirestoreModule, // imports firebase/firestore, only needed for database features
    AngularFireAuthModule, // imports firebase/auth, only needed for auth features
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
