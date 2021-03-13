-------------------------------------------------------------------------------
--                              funkcje                                      --
-------------------------------------------------------------------------------
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
