import { TestBed } from '@angular/core/testing';

import { DangtinService } from './dangtin.service';

describe('DangtinService', () => {
  let service: DangtinService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(DangtinService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});
