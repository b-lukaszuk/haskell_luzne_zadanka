-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums :: [Int]
nums = [1, 6, 23, 8, 4, 8, 3, 7]

-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
sumFirstLast :: (Num a) => [a] -> a
sumFirstLast someNums = head someNums + last someNums
