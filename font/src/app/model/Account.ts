export class Account {
    id: Int32Array;
    username: string;
    password: string;
    phone: string;
    isactive: boolean;
    roleId: string;
    role:Role;
    user:User;
    employee:Employee;
    isHD:string;
}

export class Role {
    id: string;
    roleName: string;
}

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
}

export class Employee {
    id: number;
    hovaTen: string;
    gender: string;
    doB: Date;
    email: string;
    phone: string;
    country: string;
    employeeImage: string;
    createdate:Date;
    lastlogdata:Date;
    addressOne:string;
    addressTwo:string;
    city:string;
    accountid:Int32Array;
    account:Account;
}
