import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogmotelduyettinComponent } from './dialogmotelduyettin.component';

describe('DialogmotelduyettinComponent', () => {
  let component: DialogmotelduyettinComponent;
  let fixture: ComponentFixture<DialogmotelduyettinComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogmotelduyettinComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogmotelduyettinComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
