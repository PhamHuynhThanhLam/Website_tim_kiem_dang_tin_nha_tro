export class Bill {
    id: string;
    timeChoice: string;
    numberDatePublish: number;
    payMoney:Float32Array;
    motelId:Int32Array;
    motel:Motel;
    sevicepriceId:Int32Array;
}

export class Motel {
    id: Int32Array;
    idNew: Int32Array;
    title: string;
    name: string;
    price: Float32Array;
    dateUpdate:Date;
    dateDue:Date;
    status:string;
    verify:boolean;
    address:string;
    description:string;
    phone:string;
    time:string;
    typemotel:string;
    areaZone:string;
    cityid: string;
    userid: Number;
    user: User;
    typeservice: string;
    bill: Bill;
    provinceid: string;
}


export class User {
    id: Number;
    firstName: string;
    lastName: string;
    createdDate: Date;
    lastLogOnDate: Date;
    Email: string;
    gender: boolean;
    title: string;
    userImage:string;
}