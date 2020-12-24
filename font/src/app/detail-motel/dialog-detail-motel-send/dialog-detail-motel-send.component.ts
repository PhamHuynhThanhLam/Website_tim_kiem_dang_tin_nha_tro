import { Component, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';

@Component({
  selector: 'app-dialog-detail-motel-send',
  templateUrl: './dialog-detail-motel-send.component.html',
  styleUrls: ['./dialog-detail-motel-send.component.css']
})
export class DialogDetailMotelSendComponent implements OnInit {

  constructor(
    public dialogRef: MatDialogRef<DialogDetailMotelSendComponent>) {}
  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }

  onNoClick(): void {
    this.dialogRef.close();
  }

}
