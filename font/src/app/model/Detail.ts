import { Motel } from '../model/Motel';
import { Typeofnew } from '../model/Typeofnew';

export class Detail {
    id: Int32Array;
    numberBath: Number;
    numberLiving: Number;
    director: string;
    legal: string;
    typelive: string;
    directormain:string;
    typeofnewId: Int32Array;
    typeofnew: Typeofnew;
    motelid:Int32Array;
    motel:Motel;
}