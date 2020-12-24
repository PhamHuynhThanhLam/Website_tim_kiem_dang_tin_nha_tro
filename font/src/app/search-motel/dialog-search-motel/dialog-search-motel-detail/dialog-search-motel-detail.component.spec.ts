import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DialogSearchMotelDetailComponent } from './dialog-search-motel-detail.component';

describe('DialogSearchMotelDetailComponent', () => {
  let component: DialogSearchMotelDetailComponent;
  let fixture: ComponentFixture<DialogSearchMotelDetailComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DialogSearchMotelDetailComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DialogSearchMotelDetailComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
