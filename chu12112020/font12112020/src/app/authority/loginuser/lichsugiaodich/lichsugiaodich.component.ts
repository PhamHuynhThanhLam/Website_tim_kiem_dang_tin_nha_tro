import { Component, OnInit, ViewChild, ChangeDetectorRef, OnDestroy } from '@angular/core';
import { DataTableDirective } from 'angular-datatables';
import { Subject } from 'rxjs';
import { BuyMoney } from 'src/app/model/BuyMoney';
import { BuymoneyService } from '../../../serviceapits/buymoney.service';

@Component({
  selector: 'app-lichsugiaodich',
  templateUrl: './lichsugiaodich.component.html',
  styleUrls: ['./lichsugiaodich.component.css']
})
export class LichsugiaodichComponent implements OnInit,OnDestroy  {

  buymoney: BuyMoney[];

  dtOptions: DataTables.Settings = {};
  dtTrigger: Subject<any> = new Subject();
  @ViewChild(DataTableDirective) dtElement: DataTableDirective;

  constructor(private chRef : ChangeDetectorRef,private buymoneysrvice : BuymoneyService) { }
  ngOnDestroy(): void {
    this.dtTrigger.unsubscribe();
  }

  ngOnInit(): void {

    this.dtOptions = {
      pagingType: 'full_numbers',
      lengthMenu: [4, 8, 12],
      autoWidth: true };

    this.reload();
    this.chRef.detectChanges();
    this.dtTrigger.next();
  }


  private reload = async () => {
    this.getbuymoneys();
  }

  public getbuymoneys(){
    this.buymoneysrvice.getBuyMoneys().subscribe(data => {
      this.buymoney = data;
    })
  }

  rerender()
  {
    this.dtElement.dtInstance.then((dtInstance : DataTables.Api) =>
    {
      dtInstance.destroy();
      this.dtTrigger.next();
    });
  }
}
