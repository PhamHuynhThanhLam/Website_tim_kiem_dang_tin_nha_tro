import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';
@Component({
  selector: 'app-dialog-search-motel-area',
  templateUrl: './dialog-search-motel-area.component.html',
  styleUrls: ['./dialog-search-motel-area.component.css']
})
export class DialogSearchMotelAreaComponent implements OnInit {

  @Input() typeSearch:string;
  @Input() areaSearch;

  @Output() areanotify: EventEmitter<string> = new EventEmitter<string>();

  @Output() areatick: EventEmitter<string> = new EventEmitter<string>();
  tickChoice;
  choice = "Tất cả"
  constructor() { 
    this.tickChoice = this.areatick;
  }

  ngOnInit(): void {
  }

  public onClick() {
    this.areanotify.emit('clicked!');
  }

  public onClickChoice(data: any) {
    this.areatick.emit(data);
    this.areanotify.emit('area');
  }

}
