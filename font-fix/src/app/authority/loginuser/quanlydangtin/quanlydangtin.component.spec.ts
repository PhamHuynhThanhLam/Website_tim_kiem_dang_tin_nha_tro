import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuanlydangtinComponent } from './quanlydangtin.component';

describe('QuanlydangtinComponent', () => {
  let component: QuanlydangtinComponent;
  let fixture: ComponentFixture<QuanlydangtinComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ QuanlydangtinComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(QuanlydangtinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
