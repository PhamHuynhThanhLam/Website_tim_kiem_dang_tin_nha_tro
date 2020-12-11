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
import { DanhMucComponent } from './Dangtin/danh-muc/danh-muc.component';
import { TrangTimKiemComponent } from './trang-tim-kiem/trang-tim-kiem.component';
import { DanhMucTinDangComponent } from './Dangtin/danh-muc-tin-dang/danh-muc-tin-dang.component';
import { ThongTinCoBanComponent } from './Dangtin/thong-tin-co-ban/thong-tin-co-ban.component';
import { ThongTinCoBanNextComponent } from './Dangtin/thong-tin-co-ban-next/thong-tin-co-ban-next.component';
import { ThongTinCoBanNextNextComponent } from './Dangtin/thong-tin-co-ban-next-next/thong-tin-co-ban-next-next.component';
import { ThongTinHinhAnhComponent } from './Dangtin/thong-tin-hinh-anh/thong-tin-hinh-anh.component';
import { ChonGoiTinThanhToanComponent } from './Dangtin/chon-goi-tin-thanh-toan/chon-goi-tin-thanh-toan.component';
import { TrangChiTietComponent } from './trang-chi-tiet/trang-chi-tiet.component';
import { UserComponent } from './user/user.component';
import { FooterComponent } from './shared/footer/footer.component';
import { HeaderComponent } from './shared/header/header.component';
import { ThanhToanDongComponent } from './thanh-toan-dong/thanh-toan-dong.component';
import { LoginComponent } from './login/login.component';
import { DashboardComponent } from './dashboard/dashboard.component';

import { NavbarAdminComponent } from './navbar-admin/navbar-admin.component';
import { SlidebarAdminComponent } from './slidebar-admin/slidebar-admin.component';
import { NavbarUserComponent } from './navbar-user/navbar-user.component';
import { SlidebarUserComponent } from './slidebar-user/slidebar-user.component';


import { AngularFireModule } from '@angular/fire';
import { AngularFirestoreModule } from '@angular/fire/firestore';
import { AngularFireAuthModule } from '@angular/fire/auth';
import { environment } from '../environments/environment';

import { FooteradminComponent } from './shared/footeradmin/footeradmin.component';


import { LoginadminComponent } from './authority/loginadmin/loginadmin.component';
import { LoginuserComponent } from './authority/loginuser/loginuser.component';
import { NotloginComponent } from './authority/notlogin/notlogin.component';

import { CKEditorModule } from 'ngx-ckeditor';

import { PaypalComponent } from './paypal/paypal.component';
import { NgxPayPalModule } from 'ngx-paypal';
import { BarsearchandbarComponent } from './shared/barsearchandbar/barsearchandbar.component';
import {NgxPaginationModule} from 'ngx-pagination';
import { ProfileuserComponent } from './authority/loginuser/profileuser/profileuser.component';
import { TindadangComponent } from './authority/loginuser/tindadang/tindadang.component';
import { TindaliveComponent } from '../app/authority/loginuser/tindalive/tindalive.component';
import { LichsugiaodichComponent } from '../app/authority/loginuser/lichsugiaodich/lichsugiaodich.component';
import { LichsuthanhtoanComponent } from '../app/authority/loginuser/lichsuthanhtoan/lichsuthanhtoan.component';
import { BanggiadichvuComponent } from '../app/authority/loginuser/banggiadichvu/banggiadichvu.component';
import { TrogiupComponent } from '../app/authority/loginuser/trogiup/trogiup.component';

import {DataTablesModule} from 'angular-datatables';

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
    PaypalComponent,
    FooterComponent,
    HeaderComponent,
    ThanhToanDongComponent,
    LoginComponent,
    DashboardComponent,
    NavbarAdminComponent,
    SlidebarAdminComponent,
    LoginadminComponent,
    NotloginComponent,
    LoginuserComponent,
    FooteradminComponent,
    NavbarUserComponent,
    SlidebarUserComponent,
    BarsearchandbarComponent,
    ProfileuserComponent,
    TindadangComponent,
    TindaliveComponent,
    LichsugiaodichComponent,
    LichsuthanhtoanComponent,
    BanggiadichvuComponent,
    TrogiupComponent
  ],
  imports: [
    BrowserModule,
    NgxPayPalModule,
    RouterModule,
    NgxPaginationModule,
    AppRoutingModule,
    OwlModule,
    DataTablesModule,
    FormsModule,
    HttpClientModule,
    CKEditorModule,
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFirestoreModule, // imports firebase/firestore, only needed for database features
    AngularFireAuthModule, // imports firebase/auth, only needed for auth features
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
