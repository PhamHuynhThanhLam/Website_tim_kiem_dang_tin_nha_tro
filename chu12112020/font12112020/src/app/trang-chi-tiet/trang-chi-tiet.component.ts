import { Component, OnInit } from '@angular/core';
import { DangtinService } from '../serviceapits/dangtin.service';
import { Motel,Image } from '../model/Motel';
import { Router, ActivatedRoute } from '@angular/router'
import { SafeHtml, DomSanitizer } from '@angular/platform-browser';

@Component({
  selector: 'app-trang-chi-tiet',
  templateUrl: './trang-chi-tiet.component.html',
  styleUrls: ['./trang-chi-tiet.component.css']
})
export class TrangChiTietComponent implements OnInit {

  motel: Motel;
  constructor(private sanitizer: DomSanitizer,private router: ActivatedRoute,public dangtinService:DangtinService) { }

  ngOnInit(): void {
    this.gtmotelbyid();
  }

  public gtmotelbyid(){
    const id = this.router.snapshot.paramMap.get("id");
    this.dangtinService.getMotelFromId(Number(id)).subscribe(getdetailmotel => this.motel = getdetailmotel)
  }

  getHTML(html: string): SafeHtml
  {
    return this.sanitizer.bypassSecurityTrustHtml(html);
  }
}
