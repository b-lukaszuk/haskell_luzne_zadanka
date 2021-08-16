module Arith4 where

-- case 5
roundTrip :: (Show a, Read a) => a -> a
roundTrip = read . show

-- case 6
roundTrip' :: (Show a, Read b) => a -> b
roundTrip' = read . show

main :: IO ()
main = do
    print (roundTrip 4)
    print $ (roundTrip' 4 :: Int)
    print (id 4)
