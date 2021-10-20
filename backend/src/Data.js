exports.generateData = (data) => [{
    "Total": data.total
    , "Negative": data.negative
    , "Positive": data.positive
    , "Pending": data.pending
    , "Currently": data.hospitalizedCurrently
    , "Recovered": data.recovered
    , "Deaths": data.death
    , "Positive + Negative": data.positive + data.negative
}]