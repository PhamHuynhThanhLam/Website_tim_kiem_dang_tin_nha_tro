import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-dialog-search-motel-direct',
  templateUrl: './dialog-search-motel-direct.component.html',
  styleUrls: ['./dialog-search-motel-direct.component.css']
})
export class DialogSearchMotelDirectComponent implements OnInit {

  @Input() typeSearch:string;
  @Input() directSearch;

  @Output() directotify: EventEmitter<string> = new EventEmitter<string>();

  @Output() directtick: EventEmitter<string> = new EventEmitter<string>();
  tickChoice;
  choice = "Tất cả"
  constructor() { 
    this.tickChoice = this.directtick;
  }

  ngOnInit(): void {
  }

  public onClick() {
    this.directotify.emit('clicked!');
  }

  public onClickChoice(data: any) {
    this.directtick.emit(data);
    this.directotify.emit('direct');
  }

}
