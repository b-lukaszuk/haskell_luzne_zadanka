-------------------------------------------------------------------------------
--                   Building Abstractions with Procedures                   --
-------------------------------------------------------------------------------
import Data.List (intercalate)
import Numeric.Natural

-- Naming and the Environment
circumference :: Floating a => a -> a
circumference r = 2 * pi * r

-- Compound Procedures
square :: Num a => a -> a
square x = x * x

sumOfSquares :: Num a => a -> a -> a
sumOfSquares x y = (square x) + (square y)

f :: Num a => a -> a
f a = sumOfSquares (a + 1) (a * 2)

-- Conditional Expressions and Predictates
myAbs :: (Ord a, Num a) => a -> a
myAbs x
  | x > 0 = x
  | x == 0 = 0
  | otherwise = negate x

myAbs' :: (Ord a, Num a) => a -> a
myAbs' x = if (x < 0) then negate x else x

-- Ex 1.3
-- Define a procedure that takes three numbers as arguments and
-- returns the sum of the squares of the two larger numbers.
getSumOfSquaresOfBigNums :: (Ord a, Num a) => a -> a -> a -> a
getSumOfSquaresOfBigNums x y z
  | (x < y) && (x < z) = sumOfSquares y z
  | (y < x) && (y < z) = sumOfSquares x z
  | otherwise = sumOfSquares x y


-- Example: Square Roots by Newton's Method
getAvg :: Fractional a => a -> a -> a
getAvg x y = (x + y) / 2

improveSqrt :: Fractional a => a -> a -> a
improveSqrt guess x = getAvg guess (x / guess)

isGoodEnoughSqrt :: (Ord a, Fractional a) => a -> a -> Bool
isGoodEnoughSqrt guess x = (abs ((square guess) - x)) < 0.001

getSqrtIter' :: (Ord a, Fractional a) => a -> a -> a
getSqrtIter' guess x =
  if (isGoodEnoughSqrt guess x)
  then guess
  else getSqrtIter' (improveSqrt guess x) x

getSqrtIter :: (Ord a, Fractional a) => a -> a
getSqrtIter x = getSqrtIter' 1 x

-- exercise 1.8. Newton's method for cube roots
cube :: Num a => a -> a
cube x = x * x * x

improveCbrt :: Fractional a => a -> a -> a
improveCbrt guess x = numerator / 3
  where numerator = (x / square guess) + 2 * guess

isGoodEnoughCbrt :: (Ord a, Fractional a) => a -> a -> Bool
isGoodEnoughCbrt guess x = (abs ((cube guess) - x)) < 0.001

getCbrtIter' :: (Ord a, Fractional a) => a -> a -> a
getCbrtIter' guess x =
  if (isGoodEnoughCbrt guess x)
  then guess
  else getCbrtIter' (improveCbrt guess x) x

getCbrtIter :: (Ord a, Fractional a) => a -> a
getCbrtIter x = getCbrtIter' 1 x

--  1.2.1 Linear Recursion and Iteration
factorial :: Natural -> Natural
factorial n = if (n <= 0) then 1 else n * factorial (n-1)

factIter :: Natural -> Natural -> Natural -> Natural
factIter product counter maxCount
  | counter > maxCount = product
  | otherwise = factIter (counter * product) (counter + 1) maxCount

factorial' :: Natural -> Natural
factorial' n = factIter 1 1 n

-- exercise 1.10. Ackermann's function
-- m and n are >= 0
-- computationally expensive, recommendation use with: m <= 3, n <= 4
ackermann :: Natural -> Natural -> Natural
ackermann m n
  | m == 0 = n + 1
  | n == 0 = ackermann (m - 1) 1
  | otherwise = ackermann (m - 1) (ackermann m (n - 1))


-- 1.2.2 Tree Recursion
fib :: Natural -> Natural
fib n
  | n == 0 = 0
  | n == 1 = 1
  | otherwise = fib (n-1) + fib (n-2)


fibIter' :: Natural -> Natural -> Natural -> Natural
fibIter' a b count
  | count == 0 = b
  | otherwise = fibIter' (a + b) a (count-1)

fibIter :: Natural -> Natural
fibIter n = fibIter' 1 0 n

-- example: Counting change
firstDenomination :: Int -> Int
firstDenomination 1 = 1
firstDenomination 2 = 5
firstDenomination 3 = 10
firstDenomination 4 = 25
firstDenomination 5 = 50
firstDenomination kindsOfCoins = 50 -- should never happen

cc :: Int -> Int -> Int
cc 0 _ = 1
cc amount kindsOfCoins
  | (amount < 0) || (kindsOfCoins == 0) = 0
  | otherwise = cc amount (kindsOfCoins - 1) +
                cc (amount - firstDenomination kindsOfCoins) kindsOfCoins

countChange :: Int -> Int
countChange amount = cc amount 5

-- ex 1.11
-- recursive process
e111 :: Natural -> Natural
e111 n
  | (n < 3) = n
  | otherwise = e111 (n-1) + 2 * e111(n-1) + 3 * e111(n-3)

-- ex 1.12
getConseqPairs :: [a] -> [[a]]
getConseqPairs [] = []
getConseqPairs [x] = []
getConseqPairs (x:xs) = [x : head xs : []] ++ getConseqPairs xs

-- Pascal's triangle recursive process
-- levels are 0 indexed, don't use negative levels
getPascTriangleRow :: Int ->[Int]
getPascTriangleRow 0 = [1]
getPascTriangleRow 1 = [1, 1]
getPascTriangleRow level = 1 : middle ++ [1]
  where middle = map sum $ getConseqPairs $ getPascTriangleRow (level - 1)

-- levels are 0 indexed, don't use negative levels
getPascTriangle :: Int -> [[Int]]
getPascTriangle maxLevel = map getPascTriangleRow [0..maxLevel]

getMaxNumWidth :: [Int] -> Int
getMaxNumWidth row = maximum . map length $ map show row

getMaxNumLen :: [[Int]] -> Int
getMaxNumLen triangle = getMaxNumWidth $ last triangle

getNumStr :: Int -> Int -> String
getNumStr n defWidth = if diff == 0 then numStr else numStr ++ pad
  where numStr = show n
        diff = defWidth - length numStr
        pad = replicate diff ' '

showRow :: Int -> Int -> [Int] -> String
showRow defNumWidth defRowWidth row = pad ++ core ++ pad
  where core = intercalate " " $ map (\n -> getNumStr n defNumWidth) row
        diff = (defRowWidth - length core) `div` 2
        pad = replicate diff ' '

-- levels are 0 indexed, don't use negative levels
-- at maxLevel = 15 maxRow is ~80 columns long
printPascTriangle :: Int -> IO ()
printPascTriangle maxLevel = putStrLn $ intercalate "\n" $
  map (\row -> showRow maxNumWidth lastRowWidth row) $ triangle
  where
    triangle = getPascTriangle maxLevel
    maxNumWidth = getMaxNumLen triangle
    lastRowWidth = (maxLevel + 1) * maxNumWidth + maxLevel
