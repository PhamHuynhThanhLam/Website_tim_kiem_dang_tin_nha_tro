import { ComponentFixture, TestBed } from '@angular/core/testing';

import { QuanlynaptienComponent } from './quanlynaptien.component';

describe('QuanlynaptienComponent', () => {
  let component: QuanlynaptienComponent;
  let fixture: ComponentFixture<QuanlynaptienComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ QuanlynaptienComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(QuanlynaptienComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
