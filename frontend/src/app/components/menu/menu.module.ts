import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { MenuComponent } from './menu.component';
import { MatRippleModule } from '@angular/material/core';


@NgModule({
  declarations: [MenuComponent],
  imports: [
    CommonModule,
    MatRippleModule
  ],
  exports: [MenuComponent]
})
export class MenuModule { }
