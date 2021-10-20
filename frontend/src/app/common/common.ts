import { toError } from "fp-ts/lib/Either";
import { flow, Lazy } from "fp-ts/lib/function";
import { TaskEither, tryCatch } from "fp-ts/lib/TaskEither";

const createThunk = <A>(promise: Promise<A>): Lazy<Promise<A>> => () => promise;

const fromThunk = <A>(thunk: Lazy<Promise<A>>): TaskEither<Error, A> =>
    tryCatch(thunk, toError)

export const taskEither = flow(createThunk, fromThunk)