import { Component, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';

@Component({
  selector: 'app-dialogsend',
  templateUrl: './dialogsend.component.html',
  styleUrls: ['./dialogsend.component.css']
})
export class DialogsendComponent implements OnInit {

  constructor(
    public dialogRef: MatDialogRef<DialogsendComponent>) {}
  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
