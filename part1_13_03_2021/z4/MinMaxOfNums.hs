-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums :: [Int]
nums = [1, 6, 23, 8, 4, 98, 3, 7, 3, 98, 4, 98]


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- w haskellu nie ma for-a, jest wiec problem z zasymulowaniem 1 loopa
-- mozna oczywiscie dac cos w stylu

-- zwraca tuple (min, max)
minMaxOfNums1 :: [Int] -> (Int, Int)
minMaxOfNums1 nums = (minimum nums, maximum nums)
-- ale, to uzywa funcji wbudowanych ktore zwracaja minimum i maksimum z listy
-- wiec chyba nie o to chodzi

-- (map|foldl|foldr wydaja sie byc odpowiednikami for-a dla roznych sytuacji)
-- moze wiec cos w stylu
-- min i max to wbudowane operatory zwracajace min-a i max-a z 2 cyfr
-- zwraca tuple (low, high)
minMaxOfNums2 :: (Ord a) => [a] -> (a, a)
-- foldl (\accCurVal curEltOfList -> newAccVal) accInitVal list
minMaxOfNums2 (x:xs) = foldl
  (\(low, high) curVal -> (min low curVal, max high curVal))
  (x, x) xs
