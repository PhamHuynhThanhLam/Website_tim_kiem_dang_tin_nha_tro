import { Component, EventEmitter, Input, OnInit, Output } from '@angular/core';

@Component({
  selector: 'app-dialog-search-motel-legal',
  templateUrl: './dialog-search-motel-legal.component.html',
  styleUrls: ['./dialog-search-motel-legal.component.css']
})
export class DialogSearchMotelLegalComponent implements OnInit {

  @Input() typeSearch:string;
  @Input() legalSearch;

  @Output() legalnotify: EventEmitter<string> = new EventEmitter<string>();

  @Output() legaltick: EventEmitter<string> = new EventEmitter<string>();
  tickChoice;
  choice = "Tất cả"
  constructor() { 
    this.tickChoice = this.legaltick;
  }

  ngOnInit(): void {
  }

  public onClick() {
    this.legalnotify.emit('clicked!');
  }

  public onClickChoice(data: any) {
    this.legaltick.emit(data);
    this.legalnotify.emit('legal');
  }

}
