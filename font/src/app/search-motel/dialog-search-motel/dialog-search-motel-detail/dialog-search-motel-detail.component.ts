import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-dialog-search-motel-detail',
  templateUrl: './dialog-search-motel-detail.component.html',
  styleUrls: ['./dialog-search-motel-detail.component.css']
})
export class DialogSearchMotelDetailComponent implements OnInit {

  @Input() typeSearch:string;
  @Input() typeSearchDetail;

  tickChoiceData;

  @Output() notify: EventEmitter<string> = new EventEmitter<string>();

  @Output() tick: EventEmitter<string> = new EventEmitter<string>();
  tickChoice;
  choice = "Tất cả"
  constructor() { 
    this.tickChoice = this.tick;
  }

  ngOnInit(): void {
  }

  public onClick() {
    this.notify.emit('clicked!');
  }

  public onClickChoice(data: any) {
    this.tick.emit(data);
    this.notify.emit('clicked!');
  }
}
