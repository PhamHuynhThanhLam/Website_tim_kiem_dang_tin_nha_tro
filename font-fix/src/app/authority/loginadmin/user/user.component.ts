import { Component, OnInit } from '@angular/core';
import { EmployeesService } from '../../../serviceapits/employees.service'
import { Router } from '@angular/router';
import { Employee } from '../../../model/Employee';

@Component({
  selector: 'app-user',
  templateUrl: './user.component.html',
  styleUrls: ['./user.component.css']
})
export class UserComponent implements OnInit {

  employees:Employee[];
  selectemployee:Employee;
  constructor(private router: Router,private employeesService: EmployeesService) { }

  ngOnInit(): void {
    this.getEmployees();
  }

  public getEmployees(){
    this.employeesService.getEmployees().subscribe(getemployees => this.employees = getemployees)
  }

  onselecte(employee:Employee): void{
    this.selectemployee = employee;
    console.log(this.selectemployee);
  }

  getImageMime(base64: string): string
  {
    if (base64.charAt(0)=='/') return 'jpg';
    else if (base64.charAt(0)=='R') return "gif";
    else if(base64.charAt(0)=='i') return 'png';
    else return 'jpeg';
  }
  getImageSource(base64: string): string
  {
    return `data:image/${this.getImageMime(base64)};base64,${base64}`; 
  }
}
