import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuanlydichvuComponent } from './quanlydichvu.component';

describe('QuanlydichvuComponent', () => {
  let component: QuanlydichvuComponent;
  let fixture: ComponentFixture<QuanlydichvuComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ QuanlydichvuComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(QuanlydichvuComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
