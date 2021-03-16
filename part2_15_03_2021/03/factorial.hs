-------------------------------------------------------------------------------
--                              funkcje                                      --
-------------------------------------------------------------------------------
-- to zadanie w zasadzie zrobiono w part1
-- tam bylo do zrobienia for-em (bez funkcji),
-- ale ja troche wybieglem w przyszlosc, tu kopiuj-wklej
-- uzycie rekursji/rekurencji

fact1 :: Int -> Int
fact1 num
  | num < 1 = error "cannot compute factorial of a negative number"
  | num == 1 = 1
  | otherwise = num * fact1 (num - 1)

-- bez rekursji/rekurencji
fact2 :: Int -> Int
fact2 num
  | num < 1 = error "cannot compute factorial of a negative number"
  | otherwise = product [1..num]
