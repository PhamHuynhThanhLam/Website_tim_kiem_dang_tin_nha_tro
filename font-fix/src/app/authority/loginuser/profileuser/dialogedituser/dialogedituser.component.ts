import { HttpClient } from '@angular/common/http';
import { Component, Inject, OnInit } from '@angular/core';
import { MatDialogRef, MAT_DIALOG_DATA} from '@angular/material/dialog';
import { Account } from  '../../../../model/Account';
import { User } from  '../../../..//model/User';
import { AngularFireStorage } from '@angular/fire/storage';
import { finalize } from 'rxjs/operators';
import { UserService } from 'src/app/serviceapits/user.service';

@Component({
  selector: 'app-dialogedituser',
  templateUrl: './dialogedituser.component.html',
  styleUrls: ['./dialogedituser.component.css']
})
export class DialogedituserComponent implements OnInit {

  public Image: File;
  myfile: string;

  public user:User;
  image;
  constructor(
    private userService:UserService,
    private storage: AngularFireStorage,
    public dialogRef: MatDialogRef<DialogedituserComponent>,@Inject(MAT_DIALOG_DATA) public data: User) {
      this.user = this.data;
    }

  ngOnInit(): void {
    this.image = this.data.userImage;
  }

  handleFileInput(event) {
    console.log(event.target.files.item(0));

    var files: FileList;
    files = event.target.files;
    const reader = new FileReader();
    reader.readAsDataURL(event.target.files.item(0));
    reader.onload = (event: any) => {
      this.myfile = event.target.result
    }   
    this.Image = files.item(0);

  }


  public loadimage = async () => {
    var nameuser = "userimages"
    var filePath = `${nameuser}/${this.Image.name.split('.').slice(0, -1).join('.')}_${new Date().getTime()}`;
    const fileRef = this.storage.ref(filePath);
    console.log(filePath);
    this.storage.upload(filePath, this.Image).snapshotChanges().pipe(
      finalize(() => {
        fileRef.getDownloadURL().subscribe((url) => {
          var user = new User();
          user.id = this.data.id;
           // Lưu mới
          user.hovaTen = this.data.hovaTen;
          user.createdDate = this.data.createdDate;
          user.lastLogOnDate = this.data.lastLogOnDate;
          user.gender = this.data.gender;
          user.email = this.data.email;
          user.facebook = this.data.facebook;
          user.userImage = url;
          user.accountid = this.data.account.id;
  
          console.log(user);
          this.userService.updateUser(user).subscribe(update => {
            alert("Lưu thành công")
          });
        })
      })
    ) .subscribe();
  }
}
