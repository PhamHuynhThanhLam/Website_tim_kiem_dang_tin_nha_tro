export class Account {
    id: Int32Array;
    username: string;
    password: string;
    phone: string;
    isactive: boolean;
    roleId: string;
    user:User;
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