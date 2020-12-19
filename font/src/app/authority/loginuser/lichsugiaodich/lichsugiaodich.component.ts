import { Component, OnInit, ViewChild, ChangeDetectorRef, OnDestroy } from '@angular/core';
import { DataTableDirective } from 'angular-datatables';
import { Subject } from 'rxjs';
import { Bill } from '../../../model/Bill';
import { Account } from '../../../model/Account';
import { BuymoneyService } from '../../../serviceapits/buymoney.service';
import { AuthenticationService } from '../../../serviceapits/authentication.service';

@Component({
  selector: 'app-lichsugiaodich',
  templateUrl: './lichsugiaodich.component.html',
  styleUrls: ['./lichsugiaodich.component.css']
})
export class LichsugiaodichComponent implements OnInit,OnDestroy  {

  bill: Bill[];
  currentAccount: Account;
  
  dtOptions: DataTables.Settings = {};
  dtTrigger: Subject<any> = new Subject();
  @ViewChild(DataTableDirective) dtElement: DataTableDirective;

  constructor(private authenticationService: AuthenticationService,private chRef : ChangeDetectorRef,private buymoneysrvice : BuymoneyService) {
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
   }

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
    this.getbills();
  }

  public getbills(){
    var id = this.currentAccount.user.id
    console.log(this.currentAccount)
    this.buymoneysrvice.getBills(id.toString()).subscribe(data => {
      this.bill = data;
      console.log(this.bill)
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
