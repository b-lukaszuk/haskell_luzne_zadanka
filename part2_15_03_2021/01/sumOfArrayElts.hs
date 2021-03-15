-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums :: [Int]
nums = [1, 6, 23, 8, 4, 8, 3, 7]

-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- zakladam, ze nie chodzi tu o wbudowana funkcje sum:
-- sum nums
-- tylko o jakis odpowiednik for loop, czy cos

-- solution 1, rekurencja
mySum1 :: (Num a) => [a] -> a
mySum1 [] = 0
mySum1 (x:xs) = x + mySum1 xs

-- solution 2, foldl1, niewykluczone, ze pod maska uzywa rekurencji
mySum2 :: (Num a) => [a] -> a
mySum2 listOfNums = foldl1 (\acc x -> acc + x) listOfNums
