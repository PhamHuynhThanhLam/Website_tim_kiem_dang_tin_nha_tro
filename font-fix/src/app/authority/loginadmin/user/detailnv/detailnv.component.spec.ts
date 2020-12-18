import { ComponentFixture, TestBed } from '@angular/core/testing';

import { DetailnvComponent } from './detailnv.component';

describe('DetailnvComponent', () => {
  let component: DetailnvComponent;
  let fixture: ComponentFixture<DetailnvComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ DetailnvComponent ]
    })
    .compileComponents();
  });

  beforeEach(() => {
    fixture = TestBed.createComponent(DetailnvComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});
