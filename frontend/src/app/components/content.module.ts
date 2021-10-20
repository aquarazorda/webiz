import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ContentComponent } from './content.component';
import { TableModule } from './table/table.module';
import { StatesModule } from './states/states.module';
import { MenuModule } from './menu/menu.module';


@NgModule({
  declarations: [
    ContentComponent
  ],
  imports: [
    CommonModule,
    TableModule,
    StatesModule,
    MenuModule
  ],
  exports: [ContentComponent]
})
export class ContentModule { }
