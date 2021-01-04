import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Motel } from 'src/app/model/Motel';
import { MotelService } from 'src/app/services/motel.service';

@Component({
  selector: 'app-dialog-edit-motel',
  templateUrl: './dialog-edit-motel.component.html',
  styleUrls: ['./dialog-edit-motel.component.css']
})
export class DialogEditMotelComponent implements OnInit {

  motel: Motel[] = [];

  constructor(public dialogRef: MatDialogRef<DialogEditMotelComponent>,@Inject(MAT_DIALOG_DATA) public data: Motel,public motelService:MotelService) {

  }

  ngOnInit(): void {

  }

  public updateMotel(){
    this.motelService.updateMotel(this.data).subscribe();
  }
}
