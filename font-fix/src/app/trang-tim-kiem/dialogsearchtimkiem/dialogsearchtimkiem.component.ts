import { Component, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';

@Component({
  selector: 'app-dialogsearchtimkiem',
  templateUrl: './dialogsearchtimkiem.component.html',
  styleUrls: ['./dialogsearchtimkiem.component.css']
})
export class DialogsearchtimkiemComponent implements OnInit {

  constructor(
    public dialogRef: MatDialogRef<DialogsearchtimkiemComponent>) {}
  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }

  onNoClick(): void {
    this.dialogRef.close();
  }
}
