import { ComponentFixture, TestBed } from '@angular/core/testing';

import { AdminduyettinComponent } from './adminduyettin.component';

describe('AdminduyettinComponent', () => {
  let component: AdminduyettinComponent;
  let fixture: ComponentFixture<AdminduyettinComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ AdminduyettinComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(AdminduyettinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
