-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums :: [Int]
nums = [1, 6, 23, 8, 4, 98, 3, 7, 3, 98, 4, 98]


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- przyjmuje jakas tablice Int-ow
-- zwraca liste tupli [(indeks, elt)]
-- indeksacja od 0 (inclusive) do (length someList) (exclusive)
myEnumerate :: [Int] -> [(Int, Int)]
myEnumerate nums = zip [0..] nums

-- przyjmuje jakas tablice Int-ow
-- zwraca tablice intow na z parzystych indeksow
-- "Zero is not considered to be even number."
getEltsAtEvenIndexes :: [Int] -> [Int]
getEltsAtEvenIndexes nums = [b | (a, b) <- myEnumerate nums, even a, a > 0]


-- przyjmuje jakas tablice Int-ow
-- zwraca srednia z Intow na parzystych indeksach
-- zarowno sum jak i length zwracaja Inty
-- w Haskell-u mozna Int `div` Int co zwraca Int
-- lub jesli chcemy po przecinku to musimy konwertowac oba Int-y do Num-ow
-- uzywamy wiec fromIntegral
getAvgOfEltsAtEvenIndexes :: [Int] -> Double
getAvgOfEltsAtEvenIndexes nums = fromIntegral (sum numsAtEvenIndexes) /
  fromIntegral (length numsAtEvenIndexes)
  where numsAtEvenIndexes = getEltsAtEvenIndexes nums
