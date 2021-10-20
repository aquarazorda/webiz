module Main where

import Prelude hiding (apply)
import Effect (Effect)
import Effect.Console (log)
import Main.Requests (sendState, sendStates, sendUs)
import Node.Express.App (App, get, listenHttp, useExternal)
import Node.Express.Types (Middleware)
import Node.HTTP (Server)

foreign import cors :: Middleware

app :: App
app = do
  useExternal cors
  get "/us" sendUs
  get "/states" sendStates
  get "/state/:state" sendState

main :: Effect Server
main = do
  listenHttp app 8080 \_ ->
    log $ "Listening on http://localhost:" <> show 8080
