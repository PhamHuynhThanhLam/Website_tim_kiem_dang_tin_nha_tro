import { ComponentFixture, TestBed } from '@angular/core/testing';

import { LichsuthanhtoanComponent } from './lichsuthanhtoan.component';

describe('LichsuthanhtoanComponent', () => {
  let component: LichsuthanhtoanComponent;
  let fixture: ComponentFixture<LichsuthanhtoanComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ LichsuthanhtoanComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(LichsuthanhtoanComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
