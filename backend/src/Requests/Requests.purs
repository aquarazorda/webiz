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
import Main.Data (generateStateData, getCurrentState, prepareTable)
import Main.Types (TableDataFromApi)
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

sendState :: HandlerM Unit
sendState = do
  stateName <- getRouteParam "state"
  states' <- liftAff $ getJson "https://covidtracking.com/api/states/info"
  data' <- liftAff $ getJson "https://covidtracking.com/api/states"
  let
    stateInfo = getCurrentState stateName states'

    stateData = getCurrentState stateName data'
  case generateStateData stateInfo stateData of
    Just d -> send d
    Nothing -> send "Error fetching data!"

sendUs :: HandlerM Unit
sendUs = do
  data' <- liftAff $ getJson "http://covidtracking.com/api/us" :: HandlerM (Maybe (NonEmptyArray TableDataFromApi))
  case data' of
    Just d -> send { table: prepareTable $ head d }
    Nothing -> send "Error fetching data!"
