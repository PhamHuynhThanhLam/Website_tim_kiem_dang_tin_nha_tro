import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogsearchtimkiemComponent } from './dialogsearchtimkiem.component';

describe('DialogsearchtimkiemComponent', () => {
  let component: DialogsearchtimkiemComponent;
  let fixture: ComponentFixture<DialogsearchtimkiemComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogsearchtimkiemComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogsearchtimkiemComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
