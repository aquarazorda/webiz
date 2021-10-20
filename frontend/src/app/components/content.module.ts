import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { ContentComponent } from './content.component';
import { MatGridListModule } from '@angular/material/grid-list';
import { TableModule } from './table/table.module';


@NgModule({
  declarations: [
    ContentComponent,
  ],
  imports: [
    CommonModule,
    TableModule,
    MatGridListModule
  ],
  exports: [ContentComponent]
})
export class ContentModule { }
