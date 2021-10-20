module Main.Types where

import Data.Nullable (Nullable)
import Foreign (Foreign)

type StateAbbreviation
  = String

type TableColumns
  = Array String

type TableColumnsSecondary
  = Array (Array String)

type ColumnSizes
  = Array Int

type TableData
  = { columns :: TableColumns
    , secondaryColumns :: TableColumnsSecondary
    , columnSizes :: ColumnSizes
    , content :: Foreign
    }

type StateData
  = { date :: String
    , name :: String
    , 
    , description :: String
    , twitter :: String
    , primarySite :: String
    , secondarySite :: String
    , table :: TableData
    }

type StateDataFromApi
  = { state :: String
    , abbreviation :: StateAbbreviation
    , notes :: String
    , name :: String
    , twitter :: String
    , covid19Site :: String
    , covid19SiteSecondary :: String
    }

type TableDataFromApi
  = { state :: String
    , total :: Nullable Int
    , negative :: Nullable Int
    , positive :: Nullable Int
    , hospitalizedCurrently :: Nullable Int
    , recovered :: Nullable Int
    , death :: Nullable Int
    }
