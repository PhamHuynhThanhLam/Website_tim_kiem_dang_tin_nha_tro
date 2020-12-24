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

import { DanhMucComponent } from './authority/loginuser/publish/danh-muc/danh-muc.component';

import { ThongTinCoBanComponent } from './authority/loginuser/publish/thong-tin-co-ban/thong-tin-co-ban.component';
import { ThongTinCoBanNextComponent } from './authority/loginuser/publish/thong-tin-co-ban-next/thong-tin-co-ban-next.component';
import { ThongTinCoBanNextNextComponent } from './authority/loginuser/publish/thong-tin-co-ban-next-next/thong-tin-co-ban-next-next.component';
import { ThongTinHinhAnhComponent } from './authority/loginuser/publish/thong-tin-hinh-anh/thong-tin-hinh-anh.component';
import { ChonGoiTinThanhToanComponent } from './authority/loginuser/publish/chon-goi-tin-thanh-toan/chon-goi-tin-thanh-toan.component';

import { FooterComponent } from './shared/footer/footer.component';
import { HeaderComponent } from './shared/header/header.component';
import { ThanhToanDongComponent } from './authority/loginuser/publish/thanh-toan-dong/thanh-toan-dong.component';
import { LoginComponent } from './login/login.component';

import { NavbarAdminComponent } from './authority/loginadmin/navbar-admin/navbar-admin.component';
import { SlidebarAdminComponent } from './authority/loginadmin/slidebar-admin/slidebar-admin.component';
import { NavbarUserComponent } from './authority/loginuser/navbar-user/navbar-user.component';


import { AngularFireModule } from '@angular/fire';
import { AngularFirestoreModule } from '@angular/fire/firestore';
import { AngularFireAuthModule } from '@angular/fire/auth';
import { environment } from '../environments/environment';

import { FooteradminComponent } from './shared/footeradmin/footeradmin.component';


import { LoginadminComponent } from './authority/loginadmin/loginadmin.component';
import { LoginuserComponent } from './authority/loginuser/loginuser.component';
import { NotloginComponent } from './authority/notlogin/notlogin.component';

import { CKEditorModule } from 'ngx-ckeditor';

import { PaypalComponent } from './authority/loginuser/publish/paypal/paypal.component';
import { NgxPayPalModule } from 'ngx-paypal';
import { BarsearchandbarComponent } from './shared/barsearchandbar/barsearchandbar.component';
import {NgxPaginationModule} from 'ngx-pagination';

import { TindadangComponent } from './authority/loginuser/tindadang/tindadang.component';
import { TindaliveComponent } from '../app/authority/loginuser/tindalive/tindalive.component';
import { LichsuthanhtoanComponent } from '../app/authority/loginuser/lichsuthanhtoan/lichsuthanhtoan.component';


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

import { EmployeesService } from './services/employees.service';


import { Ng2SearchPipeModule } from 'ng2-search-filter';

import { SocialloginComponent } from './sociallogin/sociallogin.component';
import { DetailMotelComponent } from './detail-motel/detail-motel.component';
import { DialogDetailMotelSendComponent } from './detail-motel/dialog-detail-motel-send/dialog-detail-motel-send.component';
import { SearchMotelComponent } from './search-motel/search-motel.component';
import { DialogSearchMotelComponent } from './search-motel/dialog-search-motel/dialog-search-motel.component';
import { HomeComponent } from './home/home.component';
import { AdminPublishComponent } from './authority/loginadmin/admin-publish/admin-publish.component';
import { DialogDetailMotelPublishComponent } from './authority/loginadmin/dialog-detail-motel-publish/dialog-detail-motel-publish.component';
import { EmployeePublishComponent } from './authority/loginadmin/employee-publish/employee-publish.component';
import { MagementServiceComponent } from './authority/loginadmin/magement-service/magement-service.component';
import { MagementBillComponent } from './authority/loginadmin/magement-bill/magement-bill.component';
import { MagementEmployeeComponent } from './authority/loginadmin/magement-employee/magement-employee.component';
import { EmployeeDetailComponent } from './authority/loginadmin/magement-employee/employee-detail/employee-detail.component';
import { HelpComponent } from './authority/loginuser/help/help.component';
import { MagementTransactionHistoryComponent } from './authority/loginuser/magement-transaction-history/magement-transaction-history.component';
import { MagementPublishMotelComponent } from './authority/loginuser/magement-publish-motel/magement-publish-motel.component';
import { MagementProfileComponent } from './authority/loginuser/magement-profile/magement-profile.component';
import { DialogEditPasswordComponent } from './authority/loginuser/magement-profile/dialog-edit-password/dialog-edit-password.component';
import { DialogEditPhoneComponent } from './authority/loginuser/magement-profile/dialog-edit-phone/dialog-edit-phone.component';
import { DialogEditUserComponent } from './authority/loginuser/magement-profile/dialog-edit-user/dialog-edit-user.component';
import { TableServicePriceComponent } from './table-service-price/table-service-price.component';
import { DialogSearchMotelDetailComponent } from './search-motel/dialog-search-motel/dialog-search-motel-detail/dialog-search-motel-detail.component';
import { DataMotelComponent } from './search-motel/data-motel/data-motel.component';
import { MangementChartComponent } from './authority/loginadmin/mangement-chart/mangement-chart.component';

import { ChartsModule } from 'ng2-charts';

@NgModule({
  declarations: [
    AppComponent,
    DanhMucComponent,
    HelpComponent,
    ThongTinCoBanComponent,
    ThongTinCoBanNextComponent,
    ThongTinCoBanNextNextComponent,
    ThongTinHinhAnhComponent,
    ChonGoiTinThanhToanComponent,
    EmployeeDetailComponent,
    PaypalComponent,
    FooterComponent,
    HeaderComponent,
    ThanhToanDongComponent,
    LoginComponent,
    NavbarAdminComponent,
    SlidebarAdminComponent,
    LoginadminComponent,
    NotloginComponent,
    LoginuserComponent,
    FooteradminComponent,
    NavbarUserComponent,
    BarsearchandbarComponent,
    TindadangComponent,
    TindaliveComponent,
    SocialloginComponent,
    LichsuthanhtoanComponent,
    TopheadComponent,
    EmployeePublishComponent,
    DetailMotelComponent,
    DialogDetailMotelSendComponent,
    SearchMotelComponent,
    DialogSearchMotelComponent,
    HomeComponent,
    AdminPublishComponent,
    DialogDetailMotelPublishComponent,
    MagementServiceComponent,
    MagementBillComponent,
    MagementEmployeeComponent,
    MagementTransactionHistoryComponent,
    MagementPublishMotelComponent,
    MagementProfileComponent,
    DialogEditPasswordComponent,
    DialogEditPhoneComponent,
    DialogEditUserComponent,
    TableServicePriceComponent,
    DialogSearchMotelDetailComponent,
    DataMotelComponent,
    MangementChartComponent
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
    ChartsModule,
    Ng2SearchPipeModule, // filter data search
    AngularFireModule.initializeApp(environment.firebaseConfig),
    AngularFirestoreModule, // imports firebase/firestore, only needed for database features
    AngularFireAuthModule, // imports firebase/auth, only needed for auth features
  ],
  providers: [EmployeesService,],
  bootstrap: [AppComponent]
})
export class AppModule { }