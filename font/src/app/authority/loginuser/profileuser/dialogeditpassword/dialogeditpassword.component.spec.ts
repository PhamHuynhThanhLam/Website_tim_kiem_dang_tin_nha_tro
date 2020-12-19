import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogeditpasswordComponent } from './dialogeditpassword.component';

describe('DialogeditpasswordComponent', () => {
  let component: DialogeditpasswordComponent;
  let fixture: ComponentFixture<DialogeditpasswordComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogeditpasswordComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogeditpasswordComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
