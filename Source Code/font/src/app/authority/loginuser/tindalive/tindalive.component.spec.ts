import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TindaliveComponent } from './tindalive.component';

describe('TindaliveComponent', () => {
  let component: TindaliveComponent;
  let fixture: ComponentFixture<TindaliveComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TindaliveComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TindaliveComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
