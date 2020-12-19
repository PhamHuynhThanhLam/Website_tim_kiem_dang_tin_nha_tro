import { Component, OnInit } from '@angular/core';
import { AuthenticationService } from '../serviceapits/authentication.service';
import { Account } from  '../model/Account';
import { Employee } from  '../model/Employee';
import { Router, NavigationEnd, NavigationStart } from '@angular/router';
import { Output } from '@angular/core';
import { DangtinService } from '../serviceapits/dangtin.service'
import { Location } from '@angular/common'
import { EmployeesService } from '../serviceapits/employees.service'

@Component({
  selector: 'app-slidebar-admin',
  templateUrl: './slidebar-admin.component.html',
  styleUrls: ['./slidebar-admin.component.css']
})
export class SlidebarAdminComponent implements OnInit {
  public username:string;
  admin:string;
  currentAccount: Account;
  employee:Employee;
  job:string;

  constructor(private employeeService:EmployeesService,
    private location:Location,
    private router: Router,
    private motelService: DangtinService,
    private authenticationService: AuthenticationService) { 
      this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
      
      console.log(this.currentAccount)
      this.job = this.currentAccount.roleId;
      console.log(this.job)
    }

  ngOnInit(): void {
   
    
  }

  get isAdmin() {
    if(this.username == ''){
      this.username = this.currentAccount.username;
    }
    
    return this.currentAccount && Number(this.currentAccount.roleId) === 4;
  }

  get isNotAdmin() {
    if(this.username == ''){
      this.username = this.currentAccount.username;
    }
    
    return this.currentAccount && Number(this.currentAccount.roleId) !== 4;
  }
  
}
