export class BuyMoney {
  id: Int32Array;
  idBuy: string;
  method: string;
  numberMoney: Float32Array;
  promote: Float32Array;
  receive: Float32Array;
  status:boolean;
  note: string;
  user:User;
  userid:number;
}

export class User {
  id: number;
  firstName: string;
  lastName: string;
  sex: string;
  doB: Date;
  email: string;
  country: string;
  image: string;
  createdate:Date;
  lastlogdata:Date;
}
