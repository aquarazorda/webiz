import { ViewportScroller } from '@angular/common';
import { Component } from '@angular/core';
import { HttpService } from 'src/app/services/http.service';
import { StateData } from 'src/app/types/global-data.type';
import { BaseComponent } from '../base/base.component';

interface MenuItem {
  name: string,
  abbreviation: string
}

@Component({
  selector: 'app-menu',
  templateUrl: './menu.component.html',
  styleUrls: ['./menu.component.scss']
})
export class MenuComponent extends BaseComponent {

  constructor(
    protected http: HttpService,
    private viewPortScroller: ViewportScroller
  ) {
    super(http);
  }

  setData = (data: Array<StateData>) =>
    this.data = data.map(({ name, abbreviation }) => ({
      name: name,
      abbreviation: abbreviation
    }));

  onClick = (item: MenuItem) => this.viewPortScroller.scrollToAnchor(item.abbreviation);
}
