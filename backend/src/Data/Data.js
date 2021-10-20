columns = ["Cases", "Tests", "Hospitalized", "Outcomes", "Total Test Results"]

secondaryColumns =
    [
        ["Total"]
        , ["Negative", "Pending"]
        , ["Currently"]
        , ["Recovered", "Deaths"]
        , ["Positive + Negative"]
    ]

exports.prepareTable = (data) => ({
    columns: columns,
    secondaryColumns: secondaryColumns.flat(),
    columnSizes: columns.map((_, index) => secondaryColumns[index].length),
    content: {
        "Total": data.total,
        "Negative": data.negative,
        "Positive": data.positive,
        "Pending": data.pending,
        "Currently": data.hospitalizedCurrently,
        "Recovered": data.recovered,
        "Deaths": data.death,
        "Positive + Negative": data.positive + data.negative
    }
});

exports.prepareState = (state) => (data) => ({
    name: state.name,
    abbreviation: state.state.toLower(),
    description: state.notes,
    twitter: state.twitter,
    primarySite: state.covid19Site,
    secondarySite: state.covid19SiteSecondary,
    table: this.prepareTable(data)
});