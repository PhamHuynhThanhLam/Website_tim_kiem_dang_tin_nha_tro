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
import { DanhMucComponent } from './authority/loginuser/dangtin/danh-muc/danh-muc.component';
import { TrangTimKiemComponent } from './trang-tim-kiem/trang-tim-kiem.component';
import { DanhMucTinDangComponent } from './authority/loginuser/dangtin/danh-muc-tin-dang/danh-muc-tin-dang.component';
import { ThongTinCoBanComponent } from './authority/loginuser/dangtin/thong-tin-co-ban/thong-tin-co-ban.component';
import { ThongTinCoBanNextComponent } from './authority/loginuser/dangtin/thong-tin-co-ban-next/thong-tin-co-ban-next.component';
import { ThongTinCoBanNextNextComponent } from './authority/loginuser/dangtin/thong-tin-co-ban-next-next/thong-tin-co-ban-next-next.component';
import { ThongTinHinhAnhComponent } from './authority/loginuser/dangtin/thong-tin-hinh-anh/thong-tin-hinh-anh.component';
import { ChonGoiTinThanhToanComponent } from './authority/loginuser/dangtin/chon-goi-tin-thanh-toan/chon-goi-tin-thanh-toan.component';
import { TrangChiTietComponent } from './trang-chi-tiet/trang-chi-tiet.component';
import { UserComponent } from './authority/loginadmin/user/user.component';
import { FooterComponent } from './shared/footer/footer.component';
import { HeaderComponent } from './shared/header/header.component';
import { ThanhToanDongComponent } from './authority/loginuser/dangtin/thanh-toan-dong/thanh-toan-dong.component';
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
import { BanggiadichvuComponent } from './banggiadichvu/banggiadichvu.component';
import { TrogiupComponent } from '../app/authority/loginuser/trogiup/trogiup.component';

import {DataTablesModule} from 'angular-datatables';

import { MatDialogModule, MatDialogRef } from '@angular/material/dialog';
import { BrowserAnimationsModule } from '@angular/platform-browser/animations';
import { MatSelectModule } from '@angular/material/select';
import { MatFormFieldModule } from '@angular/material/form-field';
import { MatInputModule } from '@angular/material/input';
import { MatRadioModule } from "@angular/material/radio";
import { MatButtonModule} from '@angular/material/button';
import { MatTooltipModule} from '@angular/material/tooltip';
import { MatRippleModule} from '@angular/material/core';
import { MatDatepickerModule } from '@angular/material/datepicker'; 
import { MatCheckboxModule} from '@angular/material/checkbox';

import { ReactiveFormsModule } from '@angular/forms';

import { TopheadComponent } from './shared/tophead/tophead.component';
import { QuanlydangtinComponent } from './authority/loginuser/quanlydangtin/quanlydangtin.component';
import { QuanlynaptienComponent } from './authority/loginadmin/quanlynaptien/quanlynaptien.component';
import { DetailnvComponent } from './authority/loginadmin/user/detailnv/detailnv.component';

import { EmployeesService } from '../app/serviceapits/employees.service';
import { DialogedituserComponent } from './authority/loginuser/profileuser/dialogedituser/dialogedituser.component';
import { DialogsearchtimkiemComponent } from './trang-tim-kiem/dialogsearchtimkiem/dialogsearchtimkiem.component';
import { DialogsendComponent } from './trang-chi-tiet/dialogsend/dialogsend.component';
import { DialogeditpasswordComponent } from './authority/loginuser/profileuser/dialogeditpassword/dialogeditpassword.component';
import { DialogeditphoneComponent } from './authority/loginuser/profileuser/dialogeditphone/dialogeditphone.component';

import { Ng2SearchPipeModule } from 'ng2-search-filter';
import { QuanlydichvuComponent } from './authority/loginadmin/quanlydichvu/quanlydichvu.component';
import { AdminduyettinComponent } from './authority/loginadmin/adminduyettin/adminduyettin.component';

import { NvduyettinComponent } from './authority/loginadmin/nvduyettin/nvduyettin.component';

import { SocialloginComponent } from './sociallogin/sociallogin.component';
import { DialogmotelduyettinComponent } from './../app/authority/loginadmin/dialogmotelduyettin/dialogmotelduyettin.component';


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
    SocialloginComponent,
    LichsugiaodichComponent,
    LichsuthanhtoanComponent,
    BanggiadichvuComponent,
    TrogiupComponent,
    TopheadComponent,
    QuanlydangtinComponent,
    QuanlynaptienComponent,
    DetailnvComponent,
    DialogedituserComponent,
    DialogsearchtimkiemComponent,
    DialogsendComponent,
    DialogeditpasswordComponent,
    DialogeditphoneComponent,
    QuanlydichvuComponent,
    AdminduyettinComponent,
    NvduyettinComponent,
    DialogmotelduyettinComponent
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
    MatDialogModule,
    BrowserAnimationsModule,
    MatSelectModule,
    MatFormFieldModule,
    MatInputModule,
    MatRadioModule,
    MatCheckboxModule,
    MatButtonModule,
    MatTooltipModule, 
    MatRippleModule,
    MatDatepickerModule,
    ReactiveFormsModule,
    HttpClientModule,
    CKEditorModule,
    Ng2SearchPipeModule, // filter data search
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFirestoreModule, // imports firebase/firestore, only needed for database features
    AngularFireAuthModule, // imports firebase/auth, only needed for auth features
  ],
  providers: [EmployeesService,],
  bootstrap: [AppComponent]
})
export class AppModule { }
