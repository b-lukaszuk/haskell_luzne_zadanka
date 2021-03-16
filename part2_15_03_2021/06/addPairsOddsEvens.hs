-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums1 :: (Num a) => [a]
nums1 = [1,6,23,8,4,8,3,7]
nums2 :: (Num a) => [a]
nums2 = [1,3,4,1,4]
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
addPairsOddsEvens1 :: (Num a) => [a] -> [a]
addPairsOddsEvens1 nums = zipWith (+) theOdds theEvens
  where theOdds = getEltsAtOddIndexes nums
        theEvens = getEltsAtEvenIndexes nums

-- removes last item from an array
removeLastItem :: [a] -> [a]
removeLastItem someArray = init someArray

-- zwraca tablice sum par elementow wg wzorca
-- [a, b, c, d] => [a+b, c+d]
-- jesli nieparzysta liczba elementow to ostatni jest duplikowany
addPairsOddsEvens2 :: (Num a) => [a] -> [a]
addPairsOddsEvens2 nums = zipWith (+) theOdds theEvens
  where theNums = if odd $ length nums then nums ++ [last nums] else nums
        theOdds = getEltsAtOddIndexes theNums
        theEvens = getEltsAtEvenIndexes theNums


-- Trzy przypadki wywolania (pokrycie niejasnosci z polecenia w "./README.md"):
-- 1) addPairsOddsEvens1 nums2
-- 2) addPairsOddsEvens2 nums2
-- 3) addPairsOddsEvens2 $ removeLastItem nums1
