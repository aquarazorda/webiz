import { AfterViewInit, Component } from '@angular/core';
import * as E from 'fp-ts/lib/Either';
import { HttpService } from 'src/app/services/http.service';

interface stateData {
  total: string,
  negative: string,
  positive: string,
  hospitalizedCurrently: string,
  recovered: string,
  death: string
}

interface Data {
  columns: Array<string>,
  secondaryColumns: Array<string>,
  columnSizes: Array<number>,
  data: stateData
};

type EitherData = E.Either<string, Data>;

@Component({
  selector: 'app-table',
  templateUrl: './table.component.html',
  styleUrls: ['./table.component.scss']
})
export class TableComponent implements AfterViewInit {

  public fullData: any;
  public reqData: EitherData = E.left("Fetching data");
  public isLoaded = () => E.isRight(this.reqData);

  constructor(
    private httpService: HttpService
  ) { }

  ngAfterViewInit() {
    const dataUrl = "global";
    this.httpService.get(dataUrl).then(data => {
      this.reqData = data;
      if (this.isLoaded())
        E.map((d: Data) => this.fullData = d)(data)
    });
  }

}
