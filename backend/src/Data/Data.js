exports.prepareTable = (data) => ({
    "Total": data.total,
    "Negative": data.negative,
    "Positive": data.positive,
    "Pending": data.pending,
    "Currently": data.hospitalizedCurrently,
    "Recovered": data.recovered,
    "Deaths": data.death,
    "Positive + Negative": data.positive + data.negative
});

exports.prepareState = (state) => (data) => ({
    state: state.name,
    description: state.notes,
    twitter: state.twitter,
    primarySite: state.covid19Site,
    secondarySite: state.covid19SiteSecondary,
    table: this.prepareTable(data)
});