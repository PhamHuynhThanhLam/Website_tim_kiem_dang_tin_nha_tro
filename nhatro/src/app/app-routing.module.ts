import { CommonModule } from '@angular/common';
import { importType } from '@angular/compiler/src/output/output_ast';
import { Component, NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';
import { Routes, RouterModule } from '@angular/router';
import {HomeComponent} from './home/home.component';
import{HttpClientModule} from '@angular/common/http';

const routes: Routes = [
  {path:'home', component:HomeComponent},
  {path:'', redirectTo: 'home', pathMatch:'full'}

];

@NgModule({
  imports: [
    CommonModule,
    BrowserModule,
    HttpClientModule,
    RouterModule.forRoot(routes,{
      useHash:true
    })
  ],
  exports: [RouterModule],



})
export class AppRoutingModule { }
