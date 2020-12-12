import { ComponentFixture, TestBed } from '@angular/core/testing';

import { ChothunhatroComponent } from './chothunhatro.component';

describe('ChothunhatroComponent', () => {
  let component: ChothunhatroComponent;
  let fixture: ComponentFixture<ChothunhatroComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ ChothunhatroComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(ChothunhatroComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
