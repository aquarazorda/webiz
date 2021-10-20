import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { StatesComponent } from './states.component';
import { TableModule } from '../table/table.module';
import { MatCardModule } from '@angular/material/card';

@NgModule({
  declarations: [StatesComponent],
  imports: [
    CommonModule,
    TableModule,
    MatCardModule
  ],
  exports: [StatesComponent]
})
export class StatesModule { }
