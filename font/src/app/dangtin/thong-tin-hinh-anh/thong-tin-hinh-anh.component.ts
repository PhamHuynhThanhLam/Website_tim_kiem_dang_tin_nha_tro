import { Input } from '@angular/core';
import { Component, OnInit } from '@angular/core';
import { Router } from '@angular/router';
import { DangtinService } from '../../serviceapits/dangtin.service';

@Component({
  selector: 'app-thong-tin-hinh-anh',
  templateUrl: './thong-tin-hinh-anh.component.html',
  styleUrls: ['./thong-tin-hinh-anh.component.css']
})
export class ThongTinHinhAnhComponent implements OnInit {

  public Image: File [] = [];
  load;

  myfile: string [] = [];

  constructor(private router: Router,public data:DangtinService) { }

  ngOnInit(): void {
   
  }

  handleFileInput(event) {
    console.log(event.target.files.item(0));

    var files: FileList;
    files = event.target.files;
    for(let i=0; i< files.length; i++)
    {
      const reader = new FileReader();
      reader.readAsDataURL(event.target.files[i]);
      reader.onload = (event: any) => {
        this.myfile.push(event.target.result)
      }   
      this.Image.push(files.item(i)) // lấy hình
    }
    this.load = "load";
    this.data.setdataimages(this.Image);
  }

  base64ToBlob(base64: string, type: string) 
  {
    const binaryString = window.atob(base64);
    const len = binaryString.length;
    const bytes = new Uint8Array(len);
    for (let i = 0; i < len; ++i) {
      bytes[i] = binaryString.charCodeAt(i);
    } 
    return new Blob([bytes], { type: type });
  };

  getImageMime(base64: string): string
  {
    if (base64.charAt(0)=='/') return 'jpg';
    else if (base64.charAt(0)=='R') return "gif";
    else if(base64.charAt(0)=='i') return 'png';
    else return 'image/jpeg';
  }

  next(){
   
    this.data.setdataimages(this.Image);
    this.router.navigateByUrl('/user/goithanhtoan');
  }
}
