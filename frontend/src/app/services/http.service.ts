import { Injectable } from '@angular/core';
import { pipe } from 'fp-ts/lib/function';
import * as TE from 'fp-ts/lib/TaskEither';
import { taskEither } from '../common/common';
import { Either } from 'fp-ts/lib/Either';
import { environment } from 'src/environments/environment';

@Injectable({
  providedIn: 'root'
})
export class HttpService {

  constructor() { }

  get = (path: string): Promise<Either<string, any>> => pipe(
    taskEither(fetch(`${environment.API_URL}/${path}`)),
    TE.chain(res => taskEither(res.json())),
    TE.fold(
      err => TE.left(`Error fetching data!\nerror = ${err}`),
      data => TE.right(data)
    )
  )()

}
