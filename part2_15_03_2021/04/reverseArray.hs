-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums :: [Int]
nums = [1, 6, 23, 8, 4, 8, 3, 7]

-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- rekursja explicite
reverseArray1 :: [a] -> [a]
reverseArray1 [] = []
reverseArray1 (x:xs) = reverseArray1 xs ++ [x]

-- foldl
reverseArray2 :: [a] -> [a]
reverseArray2 someList = foldl (\acc x -> x : acc) [] someList


-- foldl, ale krotszy zapis
-- wykorzystuje function currying (domyslne w haskell-u)
reverseArray3 :: [a] -> [a]
reverseArray3 = foldl (\acc x -> x : acc) []
