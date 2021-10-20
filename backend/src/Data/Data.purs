module Main.Data where

import Prelude
import Data.Array (find, zip)
import Data.Maybe (Maybe(..))
import Data.String (toLower)
import Data.Traversable (sequence)
import Data.Tuple (fst, snd)
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

generateStatesData :: Maybe (Array StateDataFromApi) -> Maybe (Array TableDataFromApi) -> Maybe (Array StateData)
generateStatesData s d = do
  states <- s
  data' <- d
  sequence (map (\t -> generateStateData (Just (fst t)) (Just (snd t))) (zip states data'))
