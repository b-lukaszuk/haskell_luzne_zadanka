-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
-- nothing to import here


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
-- nothing to declare here


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
isXmultipleOfY :: Int -> Int -> Bool
isXmultipleOfY x y = if x == y then False else mod x y == 0

remMultiplesOfX :: Int -> [Int] -> [Int]
remMultiplesOfX _ [] = []
remMultiplesOfX x ys = filter (\elt -> not $ isXmultipleOfY elt x) ys

getPrimesFromList :: Int -> Int -> [Int] -> [Int]
getPrimesFromList _ _ [] = []
-- start must be >= 2
getPrimesFromList start stop candidates =
  if start == stop
  then candidates
  else getPrimesFromList (start+1) stop $ remMultiplesOfX start candidates

getPrimesUpto :: Int -> [Int]
getPrimesUpto upto = getPrimesFromList 2 upto [2..upto]


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "Prime numbers in range [1-100] are:"
  putStrLn $ show $ getPrimesUpto 100
  putStrLn "That's it. Goodbye"
