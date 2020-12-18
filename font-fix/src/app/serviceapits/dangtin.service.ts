import { Injectable } from '@angular/core';
import { HttpClient, HttpHeaders } from '@angular/common/http';
import { BehaviorSubject } from 'rxjs';
import { Typeofnew } from '../model/Typeofnew';
import { Motel, User } from '../model/Motel';
import { AngularFireDatabase, AngularFireList } from '@angular/fire/database';
import { Observable,of, from } from 'rxjs';
import { map ,tap, catchError} from 'rxjs/operators';
import { Email } from '../model/Email';

const httpOptions ={
  headers: new HttpHeaders({'Content-Type': 'application/json'})
};


@Injectable({
  providedIn: 'root'
})
export class DangtinService {
  imageDetailList: AngularFireList<any>;

  private profileObs$: BehaviorSubject<Typeofnew> = new BehaviorSubject(null);
  private motelObs: BehaviorSubject<Motel> = new BehaviorSubject(null);

  private ImagesObs: BehaviorSubject<File[]> = new BehaviorSubject(null);

  private SearchMotel: BehaviorSubject<Motel> = new BehaviorSubject(null);

  private getlistmotel: BehaviorSubject<Motel[]> = new BehaviorSubject(null);

  messageSource = new BehaviorSubject<string>("default message");
  currentMessage = this.messageSource.asObservable();

  private urlAPI = 'https://localhost:44324';

  constructor(private http: HttpClient,private firebase: AngularFireDatabase) { }

  // method này để change source message 
  changeMessage(message) {
    this.messageSource.next(message);
  }

  getSearchMotel(): Observable<Motel> {
    return this.SearchMotel.asObservable();
  }

  setSearchMotel(motel: Motel) {
    this.SearchMotel.next(motel);
  }
  
  getImageDetailList() {
    this.imageDetailList = this.firebase.list('imageDetails');
  }

  insertImageDetails(imageDetails) {
    this.imageDetailList.push(imageDetails);
  }

  getdatamotellist(): Observable<Motel[]> {
    return this.getlistmotel.asObservable();
  }

  setdatamotellist(motel: Motel[]) {
    this.getlistmotel.next(motel);
  }

  // method này để change source message 
  getProfileObs(): Observable<Typeofnew> {
    return this.profileObs$.asObservable();
  }

  setProfileObs(profile: Typeofnew) {
    this.profileObs$.next(profile);
  }

  getdatamotel(): Observable<Motel> {
    return this.motelObs.asObservable();
  }

  setdatamotel(motel: Motel) {
    this.motelObs.next(motel);
  }

  getdataimages(): Observable<File[]> {
    return this.ImagesObs.asObservable();
  }

  setdataimages(image: File[]) {
    this.ImagesObs.next(image);
  }

  public getMotels(): Observable<Motel[]> { // vì chưa chắc sẵn sàng nên để trong observable
    return this.http.get<Motel[]>(this.urlAPI + "/api/Motels/GetMotels").pipe(
      tap(receivedMotels => receivedMotels),
      catchError(error => of([]))
    );
  }
  

  public getHighlightsMotels(): Observable<Motel[]> {
    return this.http.get<Motel[]>(this.urlAPI + "/api/Motels/Highlights").pipe(
      tap(receivedHighlightsMotels => receivedHighlightsMotels),
      catchError(error => of([]))
    );
  }

  public getNowsMotels(): Observable<Motel[]> {
    return this.http.get<Motel[]>(this.urlAPI + "/api/Motels/Nows").pipe(
      tap(receivedNowsMotels => receivedNowsMotels),
      catchError(error => of([]))
    );
  }

  public getMotelFromId(id: number): Observable<Motel>{
    const url = `${this.urlAPI + "/api/Motels"}/${id}`;
    return this.http.get<Motel>(url).pipe(
      tap(selectMotel => selectMotel),
      catchError(error => of(new Motel()))
    );
  }

  public searchmoteluser(motelsearch: Motel): Observable<Motel[]>{
    const url = `${this.urlAPI + "/api/Motels/GetMotelForSearch"}/${motelsearch}`;
    return this.http.get<Motel[]>(url).pipe(
      tap(searchmoteluserByHome => console.log(`searchmoteluserByHome = ${JSON.stringify(searchmoteluserByHome)}`)),
      catchError(error => of([]))
    );
  }

  public getmotelbytype(name: string): Observable<Motel[]>{
    const url = `${this.urlAPI + "/api/Motels/GetMotelByType"}/${name}`;
    return this.http.get<Motel[]>(url).pipe(
      tap(getmotelbytype => console.log(`getmotelbytype = ${JSON.stringify(getmotelbytype)}`)),
      catchError(error => of([]))
    );
  }
  /*
  public getmotelbytype = (name: string) => {
    const getUrl = `${this.urlAPI}/api/Motels/GetMotelByType/${name}`;
        return this.http.get<Motel[]>(getUrl).pipe(
            map((motels) => {
                if(motels != null)
                {
                    const getmotels = [];
                    motels.forEach(element => {
                      getmotels.push(element);
                    });
                    return getmotels;
                }
                else{
                    return null;
                }
            })
        )
  }
*/

  public postMotel(newMotel: Motel): Observable<Motel>{
    return this.http.post<Motel>(this.urlAPI + "/api/Motels", newMotel, httpOptions).pipe(
      tap((motel: Motel) => console.log(`inserted Motel = ${JSON.stringify(motel)}`)),
      catchError(error => of(new Motel()))
    );
  }

  public getmotelbyuser(id: number): Observable<Motel[]>{
    const url = `${this.urlAPI + "/api/Motels/GetMotelUser"}/${id}`;
    return this.http.get<Motel[]>(url).pipe(
      tap(getmotelbyuser => console.log(`getmotelbyuser = ${JSON.stringify(getmotelbyuser)}`)),
      catchError(error => of([]))
    );
  }

  public getmoteladmin(): Observable<Motel[]>{
    return this.http.get<Motel[]>(this.urlAPI + "/api/Motels/GetMotelAdmin").pipe(
      tap(receivedMotels => receivedMotels),
      catchError(error => of([]))
    );
  }

  public postEmail(newemail: Email): Observable<Email>{
    return this.http.post<Email>(this.urlAPI + "/api/Emails/Sendemail", newemail, httpOptions).pipe(
      tap((email: Email) => email),
      catchError(error => of(new Email()))
    );
  }

 
  public getmotelprovinces(name: string): Observable<Motel[]>{
    const url = `${this.urlAPI + "/api/Motels/GetMotelByProvince"}/${name}`;
    return this.http.get<Motel[]>(url).pipe(
      tap(searchmotelprovinces => console.log(`searchmotelprovinces = ${JSON.stringify(searchmotelprovinces)}`)),
      catchError(error => of([]))
    );
  }
}
