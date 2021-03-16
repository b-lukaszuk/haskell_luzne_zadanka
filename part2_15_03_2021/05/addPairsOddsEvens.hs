-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums1 :: (Num a) => [a]
nums1 = [1,6,23,8,4,8,3,7]
nums2 :: (Num a) => [a]
nums2 = [1,3,4,1,0,3]
-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- przyjmuje jakas tablice Int-ow
-- zwraca liste tupli [(indeks, elt)]
-- indeksacja od 1 (inclusive) do (length someList) (inclusive)
myEnumerate :: [a] -> [(Int, a)]
myEnumerate nums = zip [1..] nums

-- przyjmuje jakas tablice Int-ow
-- zwraca tablice intow na z parzystych indeksow
getEltsAtOddIndexes ::  [a] -> [a]
getEltsAtOddIndexes nums = [b | (a, b) <- myEnumerate nums, odd a]

-- przyjmuje jakas tablice Int-ow
-- zwraca tablice intow na z parzystych indeksow
getEltsAtEvenIndexes :: [a] -> [a]
getEltsAtEvenIndexes nums = [b | (a, b) <- myEnumerate nums, even a]

-- zwraca tablice sum par elementow wg wzorca
-- [a, b, c, d] => [a+b, c+d]
-- jesli nieparzysta liczba elementow to ostatni jest ucinany/odrzucany
addPairsOddsEvens :: (Num a) => [a] -> [a]
addPairsOddsEvens nums = zipWith (+) theOdds theEvens
  where theOdds = getEltsAtOddIndexes nums
        theEvens = getEltsAtEvenIndexes nums
