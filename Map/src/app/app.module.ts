import { BrowserModule } from '@angular/platform-browser';
import { NgModule } from '@angular/core';

import { NgxPayPalModule } from 'ngx-paypal';
import{FormsModule} from '@angular/forms';
import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { PaypallComponent } from './paypall/paypall.component';
import { MapComponent } from './map/map.component';

@NgModule({
  declarations: [
    AppComponent,
    PaypallComponent,
    MapComponent
  ],
  imports: [
    NgxPayPalModule,
    BrowserModule,
    AppRoutingModule,
    FormsModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }
