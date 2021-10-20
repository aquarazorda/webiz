import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StatesComponent } from './states.component';
import { TableModule } from '../table/table.module';

@NgModule({
  declarations: [StatesComponent],
  imports: [
    CommonModule,
    TableModule
  ],
  exports: [StatesComponent]
})
export class StatesModule { }
