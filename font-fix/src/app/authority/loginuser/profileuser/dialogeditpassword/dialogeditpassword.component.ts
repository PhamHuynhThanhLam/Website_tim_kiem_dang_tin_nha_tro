import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { Account } from  '../../../../model/Account';
import { User } from  '../../../..//model/User';

@Component({
  selector: 'app-dialogeditpassword',
  templateUrl: './dialogeditpassword.component.html',
  styleUrls: ['./dialogeditpassword.component.css']
})
export class DialogeditpasswordComponent implements OnInit {

  constructor(
    public dialogRef: MatDialogRef<DialogeditpasswordComponent>,@Inject(MAT_DIALOG_DATA) public data: User) {
    }

  ngOnInit(): void {
  }

}
