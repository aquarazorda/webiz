import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { TableComponent } from './table.component';
import { NotAvailablePipe } from 'src/app/pipes/not-available.pipe';
import { MatTableModule } from '@angular/material/table';


@NgModule({
  declarations: [
    TableComponent,
    NotAvailablePipe
  ],
  imports: [
    CommonModule,
    MatTableModule
  ],
  exports: [TableComponent]
})
export class TableModule { }
