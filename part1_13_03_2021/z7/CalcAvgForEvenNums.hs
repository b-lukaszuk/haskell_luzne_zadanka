-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums :: [Int]
nums = [1, 6, 23, 8, 4, 98, 3, 7, 3, 98, 4, 98]

-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- zarowno sum jak i length zwracaja Inty
-- w Haskell-u mozna Int `div` Int co zwraca Int
-- lub jesli chcemy po przecinku to musimy konwertowac oba Int-y do Num-ow
-- uzywamy wiec fromIntegral
getAvgForEvens :: [Int] -> Double
getAvgForEvens nums = fromIntegral (sum theEvens) /
  fromIntegral (length theEvens)
  where theEvens = filter even nums
