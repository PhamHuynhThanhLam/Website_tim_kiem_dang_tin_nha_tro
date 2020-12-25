import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject } from 'rxjs';
import { NewType } from '../model/NewType';
import { Motel } from '../model/Motel';
import { Account } from '../model/Account';
import { AngularFireDatabase, AngularFireList } from '@angular/fire/database';
import { Observable,of, from } from 'rxjs';
import { map ,tap, catchError} from 'rxjs/operators';

@Injectable({
  providedIn: 'root'
})
export class BehaviorSubjectClass {

  messageSource = new BehaviorSubject<string>("default message");
  currentMessage = this.messageSource.asObservable();

  //messgerImageuser = new BehaviorSubject<string>("default message");
  //currentImageuser = this.messgerImageuser.asObservable();

  private searchMotel: BehaviorSubject<Motel> = new BehaviorSubject(null);

  private getListMotel: BehaviorSubject<Motel[]> = new BehaviorSubject(null);

  private newTypes: BehaviorSubject<NewType> = new BehaviorSubject(null);

  private motelPulish: BehaviorSubject<Motel> = new BehaviorSubject(null);

  private imagesFile: BehaviorSubject<File[]> = new BehaviorSubject(null);


  
  constructor(private firebase: AngularFireDatabase) { }

  // method này để change source message 
  //changeMessage(message) {
  //  this.messageSource.next(message);
  //}

  //
  //changeMessageuser(message) {
  //  this.messgerImageuser.next(message);
  //}

  //
  getSearchMotel(): Observable<Motel> {
    return this.searchMotel.asObservable();
  }

  setSearchMotel(motel: Motel) {
    this.searchMotel.next(motel);
  }
  //
  getDataMotelList(): Observable<Motel[]> {
    return this.getListMotel.asObservable();
  }

  setDataMotelList(motel: Motel[]) {
    this.getListMotel.next(motel);
  }

  //
  getNewTypes(): Observable<NewType> {
    return this.newTypes.asObservable();
  }

  setNewTypes(profile: NewType) {
    this.newTypes.next(profile);
  }

  getDataMotel(): Observable<Motel> {
    return this.motelPulish.asObservable();
  }

  setDataMotel(motel: Motel) {
    this.motelPulish.next(motel);
  }

  getDataImages(): Observable<File[]> {
    return this.imagesFile.asObservable();
  }

  setDataImages(image: File[]) {
    this.imagesFile.next(image);
  }

  
  
}
