import { Component, OnInit } from '@angular/core';
import { EmployeesService } from '../../../services/employees.service'
import { Router } from '@angular/router';
import { Employee } from '../../../model/Employee';

@Component({
  selector: 'app-magement-employee',
  templateUrl: './magement-employee.component.html',
  styleUrls: ['./magement-employee.component.css']
})
export class MagementEmployeeComponent implements OnInit {

  employees:Employee[];
  selectEmployee:Employee;

  constructor(private router: Router,private employeesService: EmployeesService) { }

  ngOnInit(): void {
    this.getEmployees();
  }

  public getEmployees(){
    this.employeesService.getEmployees().subscribe(getemployees => {
      this.employees = getemployees
    })
  }

  onselecte(employee:Employee): void{
    this.selectEmployee = employee;
    console.log(this.selectEmployee);
  }

}
