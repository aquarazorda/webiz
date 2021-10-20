import { Component, Input, OnInit } from '@angular/core';
import { CombinedData, EitherData } from 'src/app/types/global-data.type';
import * as E from 'fp-ts/lib/Either';
import * as T from 'fp-ts/lib/Task';
import { HttpService } from 'src/app/services/http.service';

@Component({
    selector: 'app-base',
    template: ''
})
export class BaseComponent implements OnInit {

    @Input() dataUrl: string = "";
    @Input() inputData?: CombinedData;
    public data?: any;
    public reqData: EitherData<CombinedData> = E.left("Data loading hasn't started yet.");
    public isLoaded = () => E.isRight(this.reqData);

    constructor(protected http: HttpService) { }

    ngOnInit() {
        this.loadData();
    }

    loadData = () => this.inputData
        ? this.setData(this.inputData) : this.http.get(this.dataUrl).then(this.onData);

    setReqData = (data: EitherData<CombinedData>) => this.reqData = data;

    setData = (data: any) => this.data = data;

    // todo make it wih IO
    onData = (data: EitherData<CombinedData>) => {
        this.setReqData(data);
        if (this.isLoaded()) E.map(this.setData)(data)
    }

}
