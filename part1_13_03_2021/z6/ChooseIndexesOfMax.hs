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
-- indeksacja od 0 (incl) do (length someList) (exclusive)
myEnum :: [Int] -> [(Int, Int)]
myEnum someList = zip [0..] someList

-- przyjmuje jakas tablice Int-ow
-- zwraca liste tupli [(indeks, maxElt)]
getMaxesFromEnums :: [Int] -> [(Int, Int)]
getMaxesFromEnums someList = [(a, b) | (a, b) <- myEnum someList, b == theMax]
  where theMax = maximum someList

-- przyjmuje jakas tablice Int-ow
-- zwraca liste ineksow maksow z zasiegu: 0 (incl) length someList (excl)
getMaxesIds :: [Int] -> [Int]
getMaxesIds someList = [a | (a, b) <- getMaxesFromEnums someList]
