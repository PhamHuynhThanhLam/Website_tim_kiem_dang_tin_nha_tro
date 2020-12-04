import { Component ,AfterViewChecked} from '@angular/core';


declare let paypal:any;

@Component({
  selector: 'app-root',
  templateUrl: './app.component.html',
  styleUrls: ['./app.component.css']
})
export class AppComponent {
    title='paypal'
    addScript:boolean = false;
    finalAmount: number = 1;
    paypalConfig={
      env:'sandbox',
      client:{
        sandbox:'AXiOfoY1qh9gxLWb7CddmOYkjH6sYh9NEg1LPeGJtJhTmuNgXwbY5ox_S59-RTBKaiPkKAkqKvBZ9HUJ',
        production:'EKNmRkhllzdG7jkCKO-A2aS4xoLDv1i_4CqAMmMCQ6f5_gjgzAdwaQTaD2-MVnHiLcvYQ-idpohZNQlv'
      },
      commit:true,
      payment:(data,actions) =>{
        return actions.payment.create({
          payment:{
            transaction:[
              {amount:{total:this.finalAmount,currency:'USD'}}
            ]
          }
        });

      },
      onAuthorize:(data,actions)=>{
        return actions.payment.execute().then((payment)=>{
          //Do something wwhen payment is succesful
        })
      }
    };
  ngAfterViewChecked():void{
    if(!this.addScript){
      this.addPaypalScript().then(()=>{
        paypal.button.render(this.paypalConfig,'//paypal-checout-btn');
      })
    }
  }
  addPaypalScript(){
    this.addScript=true;
    return new Promise((resolve,rejects)=>{
      let scripttagElement=document.createElement('script');
      scripttagElement.src='https://www.paypalobjects.com/api/checkout.js';
      scripttagElement.onload=resolve;
      document.body.appendChild(scripttagElement);
    })
  }
}
