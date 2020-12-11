import { ComponentFixture, TestBed } from '@angular/core/testing';

import { TrogiupComponent } from './trogiup.component';

describe('TrogiupComponent', () => {
  let component: TrogiupComponent;
  let fixture: ComponentFixture<TrogiupComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ TrogiupComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(TrogiupComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
