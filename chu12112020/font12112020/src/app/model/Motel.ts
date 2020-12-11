import { Detail } from '../model/Detail';

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
    city: City;
    userid: Number;
    user: User;
    typeservice: string;
    images: Image[];
    bill: Bill;
    detail:Detail;
    provinceid: string;
    province: Province;
}

export class Image {
    imageMotel: string;
}

export class Province {
    id: string;
    name: string;
    cityid: string;
    city: City;
}

export class Bill {
    id: string;
    timeChoice: string;
    numberDatePublish: Int32Array;
    payMoney:Float32Array;
    motelId:Int32Array;
    sevicepriceId:Int32Array;
}

export class City {
    id: string;
    name: string;
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