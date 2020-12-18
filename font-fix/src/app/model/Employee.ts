export class Employee {
    id: number;
    firstName: string;
    lastName: string;    
    gender: string;
    doB: Date;
    email: string;
    phone: string;
    country: string;
    image: string;
    createdate:Date;
    lastlogdata:Date;
    addressOne:string;
    addressTwo:string;
    city:string;
    accountid:Int32Array;
    account:Account;
}

export class Account {
    id: Int32Array;
    username: string;
    password: string;
    phone: string;
    isactive: boolean;
    roleId: string;
}