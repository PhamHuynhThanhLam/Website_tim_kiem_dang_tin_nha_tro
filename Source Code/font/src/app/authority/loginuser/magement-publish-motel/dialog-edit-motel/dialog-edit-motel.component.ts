import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA } from '@angular/material/dialog';
import { Motel } from 'src/app/model/Motel';
import { Account } from 'src/app/model/Account';
import { NewType } from 'src/app/model/NewType';
import { AuthenticationService } from 'src/app/services/authentication.service';
import { MotelService } from 'src/app/services/motel.service';
import { ImageService } from 'src/app/services/image.service';
import { TypeofnewService } from 'src/app/services/newstype.service';
import { CitiesService } from 'src/app/services/cities.service';
import { ProvincesService } from 'src/app/services/provinces.service';
import { City } from 'src/app/model/City';
import { Province } from 'src/app/model/Province';
import { LiveType } from 'src/app/model/LiveType';
import { AngularFireStorage } from '@angular/fire/storage';
import { finalize } from 'rxjs/operators';
import { Image } from 'src/app/model/Image';

export interface Data{
  id:number;
  text:string;
}

@Component({
  selector: 'app-dialog-edit-motel',
  templateUrl: './dialog-edit-motel.component.html',
  styleUrls: ['./dialog-edit-motel.component.css']
})
export class DialogEditMotelComponent implements OnInit {

  motel: Motel[] = [];
  newTypes: NewType [] = [];
  newType;

  currentAccount:Account;
  cities: City[] = [];
  city;

  provinces: Province[] = [];
  procince

  phoneMotel;

  typePriceMotels:Array<Data> = [
    {id: 0, text:'đồng/tháng'},
    {id: 1, text:'triệu/tháng'},
  ];
  typePriceShowMotels: Data[] = [];
  typePriceMotel;

  directs:Array<Data> = [
    {id: 0, text:'Đông'},
    {id: 1, text:'Tây'},
    {id: 2, text:'Nam'},
    {id: 3, text:'Bắc'},
    {id: 4, text:'Đông Bắc'},
    {id: 5, text:'Đông Nam'},
    {id: 6, text:'Tây Bắc'},
    {id: 7, text:'Tây Nam'},
  ];
  directsShow: Data[] = [];
  direct;

  liveTypes:LiveType[] = [];
  liveType;

  numberBath: string;
  numberLiving: string;
  
  btnDisabledBath = true;
  btnDisabledLiving = true;
  
  arrayTrue: boolean[] = [];

  loadImageFromPC: string [] = [];
  oldImage: Image [] = [];
  motelImageDelete: Image [] = [];

  image: File [] = [];
  imagesURLFirebare: string[] = [];

  motelUpdate: Motel = new Motel();
  
  checkOutOfDate = false;

  address: string = "";
  price = new Float32Array(0);
  areaZone:string = "";
  title:string = "";
  decription:string = "";

  constructor(private storage: AngularFireStorage,private imageService: ImageService,private cityService: CitiesService, private provinceService: ProvincesService,private authenticationService: AuthenticationService,private typeservice:TypeofnewService,public dialogRef: MatDialogRef<DialogEditMotelComponent>,@Inject(MAT_DIALOG_DATA) public data: Motel,public motelService:MotelService) {
    this.getNewTypes();
    this.getCities();
    this.getLiveType();
    this.getTypePrice();
    this.getDirect();

    this.address = this.data.address;
    this.price = this.data.price;
    this.areaZone = this.data.areaZone;
    this.title = this.data.title;
    this.decription = this.data.description;

    if(this.data.status == "Tin đã hết hạn"){
      this.checkOutOfDate = true;
    }

    this.motelUpdate = this.data;
    // load image
    for(let i=0 ;i< this.data.images.length;i++){
      this.loadImageFromPC.push(this.data.images[i].imageMotel)
    }

    this.oldImage = this.data.images;

    this.numberBath = this.data.detail.numberBath.toString();
    this.numberLiving = this.data.detail.numberLiving.toString();

    this.authenticationService.currentAccount.subscribe(x => this.currentAccount = x);    
    this.phoneMotel = this.data.phone;
  }

  ngOnInit(): void {

  }


  public increaseNumberBath()
  {
    this.numberBath = (Number(this.numberBath) + 1).toString();
    this.btnDisabledBath = false;
    this.motelUpdate.detail.numberBath = Number(this.numberBath);
  }

  public decreaseNumberBath()
  {
    this.numberBath = (Number(this.numberBath) - 1).toString();
    if(Number(this.numberBath) == 0){
      this.btnDisabledBath = true;
    }
    this.motelUpdate.detail.numberBath = Number(this.numberBath);
  }

  public increaseNumberLiving()
  {
    this.numberLiving = (Number(this.numberLiving) + 1).toString();
    this.btnDisabledLiving = false;
    this.motelUpdate.detail.numberLiving = Number(this.numberLiving);

  }

  public decreaseNumberLiving()
  {
    this.numberLiving = (Number(this.numberLiving) - 1).toString();
    if(Number(this.numberLiving) == 0){
      this.btnDisabledLiving = true;
    }
    this.motelUpdate.detail.numberLiving = Number(this.numberLiving);
  }

  public getTypePrice(){
    for(let i=0 ;i<this.typePriceMotels.length; i++){
      if(this.data.priceType == this.typePriceMotels[i].text){
        this.typePriceShowMotels.push(this.typePriceMotels[i])
        break;
      }
    }
    for(let i=0 ;i<this.typePriceMotels.length; i++){
      if(this.data.priceType != this.typePriceMotels[i].text){
        this.typePriceShowMotels.push(this.typePriceMotels[i])
      }
    }
  }

  public getDirect(){
    for(let i=0 ;i<this.directs.length; i++){
      if(this.data.detail.director == this.directs[i].text){
        this.directsShow.push(this.directs[i])
        break;
      }
    }
    for(let i=0 ;i<this.directs.length; i++){
      if(this.data.detail.director != this.directs[i].text){
        this.directsShow.push(this.directs[i])
      }
    }
  }

  public getLiveType(){
    this.motelService.getLiveTypes().subscribe(getlivetype => {
      this.liveTypes = getlivetype
      for(let i=0;i<getlivetype.length;i++){
        if(this.data.detail.liveTypeId == getlivetype[i].id)
        {
          this.arrayTrue.push(true);
        }
        else{
          this.arrayTrue.push(false);
        }
      }
    })
  }

  public getCities(){
    this.cityService.getCitys().subscribe(getcity => {
      for(let i=0; i< getcity.length; i++){
        if(getcity[i].id == this.data.cityId){
          this.cities.push(getcity[i]);
          this.getProvinceById(getcity[i].id)
          break;
        }
      }

      for(let i=0; i< getcity.length; i++){
        if(getcity[i].id != this.data.cityId){
          this.cities.push(getcity[i]);
        }
      }
    })
  }

  public getProvinceById(ID){
    const list = this.provinceService.getProvincesByCity(Number(ID)).subscribe((data) => {
      for (let i = 0; i < data.length; i++) {
        let province = new Province();
        province.id = data[i].id;
        province.name = data[i].name;
        this.provinces.push(province);
      }
    })
  }

  public getNewTypes = async () => {
    this.typeservice.getTypeExcepts().subscribe(gettypes => {
      for (let i = 0; i < gettypes.length; i++) {
        if(this.data.detail.typeofnewId.toString() == gettypes[i].id){
          this.newTypes.push(gettypes[i]);

          break;
        }
      }
      for (let i = 0; i < gettypes.length; i++) {
        if(this.data.detail.typeofnewId.toString() != gettypes[i].id){
          this.newTypes.push(gettypes[i]);
        }
      }
    });
  }


  //Edit new
  public onChangeNewType(event)
  {
    let value = event.target.value;
    this.newType = value;
    var id = this.newTypes.find(a => a.name == value);
    this.motelUpdate.detail.typeofnewId = Number(id.id);
  }

  public onChangeCity(event)
  {
    let value = event.target.value;
    this.city = value;
    var id = this.cities.find(a => a.name == value);
    this.motelUpdate.cityId = id.id;
  }

  public onChangeProvince(event)
  {
    let value = event.target.value;
    this.procince = value;
    var id = this.provinces.find(a => a.name == value);
    this.motelUpdate.provinceId = id.id;
  }

  public onChangePriceType(event)
  {
    let value = event.target.value;
    this.typePriceMotel = value;
    this.motelUpdate.priceType = value;
  }

  public onChangeDirect(event)
  {
    let value = event.target.value;
    this.direct = value;
    this.motelUpdate.detail.director = value;
  }

  public onChangeLiveType(event, liveTypes: LiveType)
  {
    this.liveType = liveTypes.nameType;
    this.motelService.getLiveTypes().subscribe(getlivetype => {
      var id = getlivetype.find(a => a.nameType == this.liveType)
      this.motelUpdate.detail.liveTypeId = id.id;
    })
   
  }

  public handleFileInput(event) {
    var files: FileList;
    files = event.target.files;
  
    for(let i=0; i< files.length; i++)
    {
      const reader = new FileReader();
      reader.readAsDataURL(event.target.files[i]);
      reader.onload = (event: any) => {
        this.loadImageFromPC.push(event.target.result)
      }   
      this.image.push(files.item(i)) // lấy hình
    }
  }

  public onDelete(id){
    if(this.image.length == 1){
      var fileNew : File[] =[];
      this.image = fileNew;
    }
    this.loadImageFromPC.forEach((element,index)=>{
      if(index == id) {
        this.loadImageFromPC.splice(id,1);
      }
    });

    this.oldImage.forEach((element,index)=>{
      if(index == id) {
        this.motelImageDelete.push(this.oldImage[index])
      }
    });
  }


  public loadImage = async () => {
    if(this.image.length){
      for(let i=0; i< this.image.length;i++){
        var temp = this.image.length;
        var filePath = `${this.data.title}/${this.image[i].name.split('.').slice(0, -1).join('.')}_${new Date().getTime()}`;
        const fileRef = this.storage.ref(filePath);
        this.storage.upload(filePath, this.image[i]).snapshotChanges().pipe(
          finalize(() => {
            fileRef.getDownloadURL().subscribe((url) => {
              this.imagesURLFirebare.push(url);
              if(Number(this.image.length) == Number(this.imagesURLFirebare.length)){
                this.updateMotel();
                
              }
            })
          })
        ) .subscribe();
      } 
    }
    else{
      if(this.address != "")
      {
        this.motelUpdate.address = this.address;
      }
      var float32 = new Float32Array(0);
      if(this.price != float32)
      {
        this.motelUpdate.price = this.price;
      }
      if(this.areaZone != "")
      {
        this.motelUpdate.areaZone = this.areaZone;
      }
      if(this.title != "")
      {
        this.motelUpdate.title = this.title;
      }
      if(this.decription != "")
      {
        this.motelUpdate.description = this.decription;
      }
      //console.log(this.motelUpdate);
      this.motelService.updateMotel(this.motelUpdate).subscribe(data => {
        console.log(data);
      });
      alert("Sửa thành công")
      this.dialogRef.close();
    }
   
      
  }

  public updateMotel(){
    this.motelService.updateMotel(this.data).subscribe();
    var motel: Motel;   
    for(let i=0; i<this.motelImageDelete.length;i++){
      this.imageService.deleteImage(Number(this.motelImageDelete[i].id)).subscribe()
    }

    var motel = new Motel();
    for(let i=0; i<this.imagesURLFirebare.length;i++){
      var image: Image; 
      image.imageMotel = this.imagesURLFirebare[i];
      image.motelId = this.motelUpdate.id.toString();
      motel.images.push(image);   
    }
    if(this.imagesURLFirebare.length){
      this.imageService.postImageMotel(motel).subscribe();
    }

    alert("Sửa thành công")
    this.dialogRef.close();
  }
}
