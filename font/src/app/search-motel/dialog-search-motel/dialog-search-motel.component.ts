import { Component, Input, OnInit, Output } from '@angular/core';
import { MatDialog, MatDialogRef } from '@angular/material/dialog';
import { AreaSearch } from 'src/app/model/AreaSearch';
import { AreaSearchService } from '../../services/area-search.service'

export interface Type{
  id:number;
  name:string;
}

@Component({
  selector: 'app-dialog-search-motel',
  templateUrl: './dialog-search-motel.component.html',
  styleUrls: ['./dialog-search-motel.component.css']
})
export class DialogSearchMotelComponent implements OnInit {

  wasverify: any;
  
  openDetailSearch;

  areaSearch;

  directs:Array<Type> = [
    {id: 0, name:'Đông'},
    {id: 1, name:'Tây'},
    {id: 2, name:'Nam'},
    {id: 3, name:'Bắc'},
    {id: 4, name:'Đông Bắc'},
    {id: 5, name:'Đông Nam'},
    {id: 6, name:'Tây Bắc'},
    {id: 7, name:'Tây Nam'},
  ];

  legals:Array<Type> = [
    {id: 0, name:'Sổ đỏ'},
    {id: 1, name:'Sổ hồng'},
    {id: 2, name:'Sổ trắng'},
    {id: 3, name:'Giấy chứng nhận quyền sở hữu'},
    {id: 4, name:'Giấy tờ hợp lệ'},
    {id: 5, name:'Giấy phép xây dựng'},
    {id: 6, name:'Giấy phép kinh doanh'},
    {id: 7, name:'Giấy viết tay'},
    {id: 8, name:'Đang hơp thức hóa'},
    {id: 9, name:'Chưa xác định'},
  ];

  hasToTick = "";

  constructor(public dialog: MatDialog,
    private areaSearchService:AreaSearchService,
    public dialogRef: MatDialogRef<DialogSearchMotelComponent>) {}

  ngOnInit(): void {
    throw new Error('Method not implemented.');
  }

  public onNotify(message: string): void { 
    this.wasverify = ""
  }

  public onTick(message: string): void { 
    this.hasToTick = "Tick xanh";
  }

  public onNoClick(): void {
    this.dialogRef.close();
  }

  public onChoiceArea(){
    this.wasverify = "Xac Thuc";
    this.openDetailSearch = "Diện tích";
    this.areaSearchService.getAreaSearch().subscribe(getareasaerch => {
      this.areaSearch = getareasaerch
      console.log(this.areaSearch)
    });
  }

  public onChoiceDirect(){
    this.wasverify = "Xac Thuc";
    this.openDetailSearch = "Hướng";
    this.areaSearch = this.directs;
  }

  public onChoiceLegal(){
    this.wasverify = "Xac Thuc";
    this.openDetailSearch = "Pháp lý";
    this.areaSearch = this.legals;
  }

}
