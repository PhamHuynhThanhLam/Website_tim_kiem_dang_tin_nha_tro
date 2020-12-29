import { Input } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { MotelService } from '../../../../services/motel.service';
import { BehaviorSubjectClass } from '../../../../services/behaviorsubject'
import { Motel } from 'src/app/model/Motel';

@Component({
  selector: 'app-thong-tin-hinh-anh',
  templateUrl: './thong-tin-hinh-anh.component.html',
  styleUrls: ['./thong-tin-hinh-anh.component.css']
})
export class ThongTinHinhAnhComponent implements OnInit {

  image: File [] = [];
  checkLoad;

  loadImageFromPC: string [] = [];
  imageprevous:File [] = [];
  
  constructor(private behaviorSubjectClass: BehaviorSubjectClass,private router: Router,public motelService:MotelService) { 

  }

  ngOnInit(): void {
   
  }

  public handleFileInput(event) {
    console.log(event.target.files.item(0));

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
    this.checkLoad = "load";

  }

  public next(){
    this.behaviorSubjectClass.setDataImages(this.image);
    this.router.navigateByUrl('/user/goi-thanh-toan');
  }

  public prevous(){
    this.router.navigateByUrl('/user/thong-tin-chi-tiet-nha-tro');
  }
}
