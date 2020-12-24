import { Component, OnInit } from '@angular/core';
import { IPayPalConfig, ICreateOrderRequest } from 'ngx-paypal';
import { HttpClient } from '@angular/common/http';
import { Input } from '@angular/core';
import { Motel } from '../../../../model/Motel';
import { Image } from '../../../../model/Image';
import { Account } from '../../../../model/Account';
import { MotelService } from '../../../../services/motel.service';
import { ServicePriceService } from '../../../../services/service-price.service';

import { AngularFireStorage } from '@angular/fire/storage';
import { finalize } from 'rxjs/operators';
import { DomSanitizer,SafeUrl, SafeResourceUrl } from '@angular/platform-browser';
import { AuthenticationService} from '../../../../services/authentication.service'

import { Router } from '@angular/router';
import { Serviceprice } from 'src/app/model/Serviceprice';
import { BehaviorSubjectClass } from '../../../../services/behaviorsubject'

@Component({
  selector: 'app-paypal',
  templateUrl: './paypal.component.html',
  styleUrls: ['./paypal.component.css']
})
export class PaypalComponent implements OnInit {
  
  payPalConfig?: IPayPalConfig;
  showSuccess: boolean;

  //Lấy data
  newTypeMotel;
  imageMotels: File [] = [];
  saveNewMotel: Motel;
  imagesURLFirebare:Array<string> = [];
  addimages:Image;
  currentAccount:Account;
  @Input() moneyMotel;

  number:string = "";

  resultSaveMotel:Motel[];

  constructor(private behaviorSubjectClass: BehaviorSubjectClass,private priceService: ServicePriceService,private router: Router,private authenticationService: AuthenticationService,private _sanitizer: DomSanitizer,private storage: AngularFireStorage,private http:HttpClient,public motelService:MotelService) {
    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);
  }

  ngOnInit(): void {
    this.initConfig();
  }

  private initConfig(): void {
    // Gía tiền
    console.log(this.moneyMotel);
    var usd = "0.000043";
    this.moneyMotel = this.moneyMotel * Number(usd);
    var one = -1;
    this.moneyMotel = Number((this.moneyMotel).toFixed(1));
    this.number = this.moneyMotel;
    console.log(this.number );
    this.payPalConfig = {
    currency: 'USD',
    clientId: 'sb',
    createOrderOnClient: (data) => <ICreateOrderRequest>{
      intent: 'CAPTURE',
      purchase_units: [
        {
          amount: {
            currency_code: 'USD',
            value: this.moneyMotel ,
            breakdown: {
              item_total: {
                currency_code: 'USD',
                value: this.number // Gía tiền
              }
            }
          },
          items: [
            {
              name: 'Enterprise Subscription',
              quantity: '1',
              category: 'DIGITAL_GOODS',
              unit_amount: {
                currency_code: 'USD',
                value: this.number ,// Gía tiền
              },
            }
          ]
        }
      ]
    },
    advanced: {
      commit: 'true'
    },
    style: {
      label: 'paypal',
      layout: 'vertical'
    },
    onApprove: (data, actions) => {
      console.log('onApprove - transaction was approved, but not authorized', data, actions);
      actions.order.get().then(details => {
        console.log('onApprove - you can get full order details inside onApprove: ', details);

        console.log("Bạn phải thanh toán là:",this.number);// Gía tiền

        this.onSubmit();
      });
    },
    onClientAuthorization: (data) => {
      console.log('onClientAuthorization - you should probably inform your server about completed transaction at this point', data);
      this.showSuccess = true;
    },
    onCancel: (data, actions) => {
      console.log('OnCancel', data, actions);
    },
    onError: err => {
      console.log('OnError', err);
    },
    onClick: (data, actions) => {
      console.log('onClick', data, actions);
    },
  };
  }
  




  //Lưu tiền motel
  public loadImage = async () => {
    for(let i=0; i< this.imageMotels.length;i++){
      var temp = this.imageMotels.length;
      var filePath = `${this.saveNewMotel.name}/${this.imageMotels[i].name.split('.').slice(0, -1).join('.')}_${new Date().getTime()}`;
      const fileRef = this.storage.ref(filePath);
      console.log(filePath);
      this.storage.upload(filePath, this.imageMotels[i]).snapshotChanges().pipe(
        finalize(() => {
          fileRef.getDownloadURL().subscribe((url) => {
            this.imagesURLFirebare.push(url);
            console.log(this.imagesURLFirebare);
            if(Number(this.imageMotels.length) == Number(this.imagesURLFirebare.length)){
              this.save();
            }
          })
        })
      ) .subscribe();
    } 
    
  }

  public save = async () => {
    try 
    {
      console.log(this.imagesURLFirebare.length);
      console.log(this.currentAccount.user.id);
      if(this.imagesURLFirebare.length){
        console.log( this.saveNewMotel);
        this.saveNewMotel.detail.typeofnewId = this.newTypeMotel.id;  
        this.saveNewMotel.userid = this.currentAccount.user.id;
        this.saveNewMotel.status = "Tin đang ẩn";
        //this.motelnew.typeservice = this.new;
        //this.motelnew.time = this.datatime;
        
        let Finall:Image[] = [];
        for(let i=0;i<this.imagesURLFirebare.length;i++)
        {
          this.addimages = {
            imageMotel: this.imagesURLFirebare[i]
          }
          Finall.push(this.addimages);
        }
        console.log(Finall);
        this.saveNewMotel.images = Finall;
        console.log( this.saveNewMotel.images);
        console.log( this.saveNewMotel);
        this.motelService.postMotel(this.saveNewMotel).subscribe(newMotel => {
          this.resultSaveMotel.push(newMotel);
          console.log(this.resultSaveMotel);
        });

        alert('Add sucessfully');
        this.router.navigateByUrl('/user/danh-muc');
      }
      else{
        alert('Add failed');
      }
    }
    catch (e) {
      alert('Add failed');
      console.log(e);
    }
  }
  public onSubmit = async () => {
    this.behaviorSubjectClass.getDataImages().subscribe(getimagemotel => this.imageMotels = getimagemotel);
    this.behaviorSubjectClass.getNewTypes().subscribe(getnewtypemotel => this.newTypeMotel = getnewtypemotel);
    this.behaviorSubjectClass.getDataMotel().subscribe(getmotel => this.saveNewMotel = getmotel);
    console.log(this.imageMotels);
    this.loadImage();
  };
}

