getSumOfPairs :: [Int] -> [Int]
getSumOfPairs xs = zipWith (+) xs $ tail xs

getRow :: [Int] -> [Int]
getRow prevRow = 1 : getSumOfPairs prevRow ++ [1]

getPascalTriangle' :: Int -> [[Int]] -> [[Int]]
getPascalTriangle' n acc
  | n <= 0 = reverse acc
  | otherwise = getPascalTriangle' (n-1) $ getRow (head acc) : acc

getPascalTriangle :: Int -> [[Int]]
getPascalTriangle n = getPascalTriangle' n [[1]]
