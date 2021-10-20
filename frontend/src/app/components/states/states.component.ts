import { Component } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { BaseComponent } from '../base/base.component';

@Component({
  selector: 'app-states',
  templateUrl: './states.component.html',
  styleUrls: ['./states.component.scss']
})
export class StatesComponent extends BaseComponent {

  constructor(
    protected http: HttpService
  ) {
    super(http);
  }

  scrollTop = () => window.scrollTo(0, 0);
}
