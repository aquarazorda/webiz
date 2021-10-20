import { Component } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { BaseComponent } from 'src/app/components/base/base.component';
import { CombinedData, TableData } from 'src/app/types/global-data.type';


@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.scss']
})
export class TableComponent extends BaseComponent {

  public data!: TableData;

  constructor(protected http: HttpService) {
    super(http);
  }

  setData = (data: CombinedData) => this.data = data.table;

}
