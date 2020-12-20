import { Component, Input, OnInit } from '@angular/core';
import { Router, ActivatedRoute } from '@angular/router';
import { Location } from '@angular/common';
import { Employee } from '../../../../model/Employee';
import { EmployeesService } from '../../../../serviceapits/employees.service'

@Component({
  selector: 'app-detailnv',
  templateUrl: './detailnv.component.html',
  styleUrls: ['./detailnv.component.css']
})
export class DetailnvComponent implements OnInit {

  @Input() employee:Employee;
  constructor(private route:ActivatedRoute,private employeesService:EmployeesService,private location:Location) { }

  ngOnInit(): void {
    this.getEmployeesRoute();
  }

  getEmployeesRoute(): void{

  }
}
