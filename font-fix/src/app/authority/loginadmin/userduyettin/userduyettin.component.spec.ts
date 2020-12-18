import { ComponentFixture, TestBed } from '@angular/core/testing';

import { UserduyettinComponent } from './userduyettin.component';

describe('UserduyettinComponent', () => {
  let component: UserduyettinComponent;
  let fixture: ComponentFixture<UserduyettinComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ UserduyettinComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(UserduyettinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
