import { Pipe, PipeTransform } from '@angular/core';

@Pipe({name: 'searchFilter'})
export class SearchFilterPipe implements PipeTransform {

    transform(value: any[], search: string) {
      if (search) {
        search = search.toLowerCase();
          return value.filter(function (el) {   // <---- data type!
              return el.toLowerCase().indexOf(search) > -1;
          });
      }
      return value;
  }
}
