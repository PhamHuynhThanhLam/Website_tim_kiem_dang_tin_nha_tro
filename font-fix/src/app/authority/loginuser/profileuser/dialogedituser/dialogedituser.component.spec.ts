import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogedituserComponent } from './dialogedituser.component';

describe('DialogedituserComponent', () => {
  let component: DialogedituserComponent;
  let fixture: ComponentFixture<DialogedituserComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogedituserComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogedituserComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
