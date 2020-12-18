import { TestBed } from '@angular/core/testing';

import { BuymoneyService } from './buymoney.service';

describe('BuymoneyService', () => {
  let service: BuymoneyService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(BuymoneyService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
