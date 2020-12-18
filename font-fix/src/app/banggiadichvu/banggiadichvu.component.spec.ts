import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BanggiadichvuComponent } from './banggiadichvu.component';

describe('BanggiadichvuComponent', () => {
  let component: BanggiadichvuComponent;
  let fixture: ComponentFixture<BanggiadichvuComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BanggiadichvuComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(BanggiadichvuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
