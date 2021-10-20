module Main.Data.Types where

import Data.Nullable (Nullable)
import Foreign (Foreign)

type TableColumns
  = Array String

type TableColumnsSecondary
  = Array (Array String)

type ColumnSizes
  = Array Int

type GlobalData
  = { columns :: TableColumns
    , secondaryColumns :: TableColumnsSecondary
    , columnSizes :: ColumnSizes
    , data :: Foreign
    }

type GlobalDataFromApi
  = { total :: Nullable Int
    , negative :: Nullable Int
    , positive :: Nullable Int
    , hospitalizedCurrently :: Nullable Int
    , recovered :: Nullable Int
    , death :: Nullable Int
    }
