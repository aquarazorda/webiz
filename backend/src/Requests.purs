module Main.Requests where

import Prelude
import Affjax as AX
import Affjax.ResponseFormat as ResponseFormat
import Data.Argonaut.Core (Json)
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Effect.Aff (Aff)
import Effect.Aff.Class (liftAff)
import Main.Data (prepareData)
import Main.Data.Types (GlobalDataFromApi)
import Node.Express.Handler (HandlerM)
import Node.Express.Response (send)

foreign import jsonToAnyType :: forall a. Json -> a

getJson :: forall a. String -> Aff (Maybe a)
getJson url = do
  result <- AX.get ResponseFormat.json url
  case result of
    Left _ -> pure Nothing
    Right response -> pure $ Just $ jsonToAnyType response.body

sendGlobalData :: HandlerM Unit
sendGlobalData = do
  gld <- liftAff jsonData
  case gld of
    Just dt -> send $ prepareData dt
    Nothing -> send "Error creating data!"
  where
  jsonData :: Aff (Maybe GlobalDataFromApi)
  jsonData = getJson "http://covidtracking.com/api/us"
