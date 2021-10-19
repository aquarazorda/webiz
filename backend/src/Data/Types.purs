module Main.Data.Types where

import Data.Nullable (Nullable)

type TableColumns
  = Array String

type TableColumnsSub
  = Array TableColumns

type ColumnSizes
  = Array Int

type Data
  = { total :: String
    , negative :: String
    , positive :: String
    , hospitalizedCurrently :: String
    , recovered :: String
    , death :: String
    }

type GlobalData
  = { columns :: TableColumns
    , secondaryColumns :: TableColumns
    , columnSizes :: ColumnSizes
    , data :: Data
    }

type GlobalDataFromApi
  = { total :: Nullable Int
    , negative :: Nullable Int
    , positive :: Nullable Int
    , hospitalizedCurrently :: Nullable Int
    , recovered :: Nullable Int
    , death :: Nullable Int
    }
