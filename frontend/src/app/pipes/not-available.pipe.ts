import { Pipe, PipeTransform } from '@angular/core';

@Pipe({
  name: 'notAvail'
})
export class NotAvailablePipe implements PipeTransform {

  transform = (value: string | null): string =>
    value && value !== '0' ? value : 'N/A';

}
