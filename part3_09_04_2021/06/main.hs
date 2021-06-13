-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
-- nothing to import here

-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
someNums :: [Int]
someNums = [1..6]

byNum :: Int
byNum = 2

-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- needed to adjust rotation if by > length xs
getAdjustedRotation :: Int -> [Int] -> Int
getAdjustedRotation by xs =
  let lenXs = length xs
  in if by > lenXs
     then mod by lenXs
     else by

rotateBy :: Int -> [Int] -> [Int]
rotateBy _ [] = []
rotateBy 0 xs = xs
rotateBy by xs =
  let adjustedBy = getAdjustedRotation by xs
  in drop adjustedBy xs ++ take adjustedBy xs

-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn $ "Rotating a list: " ++ show someNums ++ " by: " ++ show byNum
  putStrLn $ "Result: " ++ (show $ rotateBy byNum someNums)
  putStrLn "That's it. Goodbye!"
