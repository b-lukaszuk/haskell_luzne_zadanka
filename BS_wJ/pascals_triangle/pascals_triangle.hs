import           Data.List (intercalate)

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

getNumLen :: Int -> Int
getNumLen n = length $ show n

getMaxNumLen :: [Int] -> Int
getMaxNumLen xs = maximum $ map getNumLen xs

center :: (Show a) => a -> Int -> String
center x toLen = replicate leftSpaceLen ' ' ++ s ++ replicate rightSpaceLen ' '
  where s = show x
        len = length s
        diff = toLen - len
        leftSpaceLen = diff `div` 2
        rightSpaceLen = diff - leftSpaceLen

getFmtRow :: (Show a) => [a] -> Int -> Int -> String
getFmtRow row numLen rowLen = center formattedRow rowLen
  where fmt = flip center numLen
        formattedRow = unwords $ map fmt row

fmtRow :: (Show a) => Int -> Int -> [a] -> String
fmtRow numLen rowLen row = getFmtRow row numLen rowLen

getFmtPascTriangle :: Int -> Int -> String
getFmtPascTriangle n k
  | n < 0 || k < 0 = error "n and k must be >= 0"
  | n > 10 || k > 10 = error "n and k must be <= 10"
  | n < k = error "n must be >= k"
  | otherwise = result
    where triangle = getPascalTriangle n
          lastRow = last triangle
          maxNumWidth = 1 + getMaxNumLen lastRow
          lastRowWidth = (n+1) * maxNumWidth + n
          rowFormatter :: (Show a) => [a] -> String
          rowFormatter = fmtRow maxNumWidth lastRowWidth
          formattedTriangle = intercalate "\n" $ map rowFormatter triangle
          indicators = replicate k ' ' ++ "^" ++ replicate (n-k-1) ' '
          result = formattedTriangle ++ "\n" ++ rowFormatter indicators


main :: IO ()
main = do
  putStrLn $ getFmtPascTriangle 9 5
