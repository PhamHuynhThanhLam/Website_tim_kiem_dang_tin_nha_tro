import { ComponentFixture, TestBed } from '@angular/core/testing';

import { MotelchitietComponent } from './motelchitiet.component';

describe('MotelchitietComponent', () => {
  let component: MotelchitietComponent;
  let fixture: ComponentFixture<MotelchitietComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ MotelchitietComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(MotelchitietComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
