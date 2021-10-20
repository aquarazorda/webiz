import * as E from 'fp-ts/lib/Either';

export interface TableData {
    columns: Array<string>,
    secondaryColumns: Array<Array<string>>,
    displayedColumns: Array<string>,
    columnSizes: Array<number>,
    content: [{
        "Total": number | null,
        "Negative": number | null,
        "Positive": number | null,
        "Pending": number | null,
        "Currently": number | null,
        "Recovered": number | null,
        "Deaths": number | null,
        "Positive + Negative": number | null
    }]
}

export interface UsData {
    table: TableData
}

export interface StateData {
    name: string,
    abbreviation: string,
    description: string,
    twitter: string,
    primarySite: string,
    secondarySite: string
    table: TableData
};

export type CombinedData = UsData | StateData;

export type EitherData<A> = E.Either<string, A>;
