module Main.Data where

import Prelude
import Data.Array (concat, length)
import Data.Nullable (Nullable, null)
import Main.Data.Types (GlobalDataFromApi, GlobalData)

foreign import toString :: Nullable Int -> String

columns :: Array String
columns = [ "Cases", "Tests", "Hospitalized", "Outcomes", "Total Test Results" ]

secondaryColumns :: Array (Array String)
secondaryColumns =
  [ [ "Test" ]
  , [ "Negative", "Pending" ]
  , [ "Currently" ]
  , [ "Recovered", "Deaths" ]
  , [ "Positive + Negative" ]
  ]

correct :: Nullable Int -> String
correct n
  | n == null = "N/A"
  | otherwise = toString n

prepareData :: GlobalDataFromApi -> GlobalData
prepareData d =
  { columns: columns
  , secondaryColumns: concat secondaryColumns
  , columnSizes: map length secondaryColumns
  , data: dt
  }
  where
  dt =
    { total: correct d.total
    , negative: correct d.negative
    , positive: correct d.positive
    , hospitalizedCurrently: correct d.hospitalizedCurrently
    , recovered: correct d.recovered
    , death: correct d.death
    }
