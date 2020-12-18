import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogeditphoneComponent } from './dialogeditphone.component';

describe('DialogeditphoneComponent', () => {
  let component: DialogeditphoneComponent;
  let fixture: ComponentFixture<DialogeditphoneComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogeditphoneComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogeditphoneComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
