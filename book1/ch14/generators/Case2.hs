module Case2 where

import Test.QuickCheck

data Fool' = Fulse' | Frue' deriving (Eq, Show)

-- my modification, 5:1 will be easier to notice
gen5to1 :: Gen Fool'
gen5to1 = frequency [(5, return Fulse'), (1, return Frue')]
