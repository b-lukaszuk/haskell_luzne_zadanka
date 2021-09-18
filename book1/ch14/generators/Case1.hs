module Case1 where

import Test.QuickCheck

data Fool = Fulse | Frue deriving (Eq, Show)

eqlFool :: Gen Fool
eqlFool = elements [Fulse, Frue]
