module Main.Data where

import Prelude
import Data.Array (length)
import Foreign (Foreign)
import Main.Data.Types (GlobalDataFromApi, GlobalData)

foreign import generateData :: GlobalDataFromApi -> Foreign

columns :: Array String
columns = [ "Cases", "Tests", "Hospitalized", "Outcomes", "Total Test Results" ]

secondaryColumns :: Array (Array String)
secondaryColumns =
  [ [ "Total" ]
  , [ "Negative", "Pending" ]
  , [ "Currently" ]
  , [ "Recovered", "Deaths" ]
  , [ "Positive + Negative" ]
  ]

prepareData :: GlobalDataFromApi -> GlobalData
prepareData d =
  { columns: columns
  , secondaryColumns: secondaryColumns
  , columnSizes: map length secondaryColumns
  , data: generateData d
  }
