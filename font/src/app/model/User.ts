export class User {
    id: number;
    hovaTen: string;  
    gender: string;
    doB: Date;
    email: string;
    facebook: string;
    userImage: string;
    createdDate:Date;
    lastLogOnDate:Date;
    account:Account;
    accountid:Int32Array;
}

export class Account {
    id: Int32Array;
    username: string;
    password: string;
    phone: string;
    isactive: boolean;
    roleId: string;
    user:User;
}
