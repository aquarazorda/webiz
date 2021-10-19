module Main where

import Prelude hiding (apply)
import Effect (Effect)
import Effect.Console (log)
import Main.Requests (sendGlobalData)
import Node.Express.App (App, listenHttp, get)
import Node.HTTP (Server)

app :: App
app = do
  get "/global" sendGlobalData

main :: Effect Server
main = do
  listenHttp app 8080 \_ ->
    log $ "Listening on http://localhost:" <> show 8080
