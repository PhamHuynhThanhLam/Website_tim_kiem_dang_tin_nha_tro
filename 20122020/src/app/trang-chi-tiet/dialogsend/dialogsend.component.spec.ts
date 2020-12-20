import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogsendComponent } from './dialogsend.component';

describe('DialogsendComponent', () => {
  let component: DialogsendComponent;
  let fixture: ComponentFixture<DialogsendComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogsendComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogsendComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
