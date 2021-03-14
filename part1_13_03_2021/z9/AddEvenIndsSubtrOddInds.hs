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
-- indeksacja od 1 (inclusive) do (length someList) (inclusive)
myEnumerate :: [Int] -> [(Int, Int)]
myEnumerate nums = zip [1..] nums

-- przyjmuje jakas tablice Int-ow
-- zwraca tablice intow na z parzystych indeksow
getEltsAtEvenIndexes :: [Int] -> [Int]
getEltsAtEvenIndexes nums = [b | (a, b) <- myEnumerate nums, even a]

-- przyjmuje jakas tablice Int-ow
-- zwraca tablice intow na z nieparzystych indeksow
getEltsAtOddIndexes :: [Int] -> [Int]
getEltsAtOddIndexes nums = [b | (a, b) <- myEnumerate nums, odd a]

-- przyjmuje jakas tablice Int-ow
-- dodaje wszytkie inty na parzystych indeksach
-- odejmuje wszytskie inty na ujemnych indeksach
-- zwraca wynik tej operacji
addEvenIndsSubtrOddInds :: [Int] -> Int
addEvenIndsSubtrOddInds nums = (sum atEvenIds) + (sum toSubtract)
  where atEvenIds = getEltsAtEvenIndexes nums
        atOddIds = getEltsAtOddIndexes nums
        toSubtract = map (*(-1)) atOddIds

-- przyjmuje jakas tablice Int-ow
-- dodaje wszytkie inty na parzystych indeksach
-- odejmuje wszytskie inty na ujemnych indeksach
-- zwraca wynik tej operacji
addEvensSubtrOdds :: [Int] -> Int
addEvensSubtrOdds nums = (sum theEvens) + (sum toSubtract)
  where theEvens = filter even nums
        theOdds = filter odd nums
        toSubtract = map (*(-1)) theOdds
