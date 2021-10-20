module Main.Requests where

import Prelude
import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Data.Argonaut.Core (Json)
import Data.Array.NonEmpty (NonEmptyArray, head)
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Effect.Aff (Aff)
import Effect.Aff.Class (liftAff)
import Main.Data (generateStateData, generateStatesData, getCurrentState, prepareTable)
import Main.Types (TableDataFromApi, TableData)
import Node.Express.Handler (HandlerM)
import Node.Express.Request (getRouteParam)
import Node.Express.Response (send)

foreign import jsonToAnyType :: forall a. Json -> a

getJson :: forall a. String -> Aff (Maybe a)
getJson url = do
  result <- AX.get ResponseFormat.json url
  case result of
    Left _ -> pure Nothing
    Right response -> pure $ Just $ jsonToAnyType response.body

getStates :: forall a b. Aff { info :: Maybe a, stateData :: Maybe b }
getStates = do
  info' <- getJson "https://covidtracking.com/api/states/info"
  stateData' <- getJson "https://covidtracking.com/api/states"
  pure
    { info: info'
    , stateData: stateData'
    }

finalize :: forall a. Maybe a -> HandlerM Unit
finalize sd = case sd of
  Just d -> send d
  Nothing -> send "Error fetching data!"

sendState :: HandlerM Unit
sendState = do
  stateName <- getRouteParam "state"
  d <- liftAff getStates
  let
    stateInfo = getCurrentState stateName d.info

    stateData = getCurrentState stateName d.stateData
  finalize $ generateStateData stateInfo stateData

sendStates :: HandlerM Unit
sendStates = do
  d <- liftAff getStates
  finalize $ generateStatesData d.info d.stateData

sendUs :: HandlerM Unit
sendUs = do
  data' <- liftAff $ getJson "http://covidtracking.com/api/us"
  finalize $ prepared data'
  where
  prepared :: Maybe (NonEmptyArray TableDataFromApi) -> Maybe TableData
  prepared = liftA1 $ head >>> prepareTable
