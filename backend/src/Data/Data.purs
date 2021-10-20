module Main.Data where

import Prelude
import Data.Array (find)
import Data.Maybe (Maybe)
import Data.String (toLower)
import Main.Types (StateAbbreviation, StateData, StateDataFromApi, TableDataFromApi, TableData)

foreign import prepareTable :: TableDataFromApi -> TableData

foreign import prepareState :: StateDataFromApi -> TableDataFromApi -> StateData

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

getCurrentState :: forall a. Maybe StateAbbreviation -> Maybe (Array { state :: String | a }) -> Maybe { state :: String | a }
getCurrentState s ss = do
  stateName <- s
  states <- ss
  find (\state -> (toLower state.state) == stateName) states

generateStateData :: Maybe StateDataFromApi -> Maybe TableDataFromApi -> Maybe StateData
generateStateData s d = do
  state <- s
  data' <- d
  pure $ prepareState state data'
