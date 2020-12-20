import { ComponentFixture, TestBed } from '@angular/core/testing';

import { NvduyettinComponent } from './nvduyettin.component';

describe('NvduyettinComponent', () => {
  let component: NvduyettinComponent;
  let fixture: ComponentFixture<NvduyettinComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ NvduyettinComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(NvduyettinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
