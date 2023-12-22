-------------------------------------------------------------------------------
--                   Building Abstractions with Procedures                   --
-------------------------------------------------------------------------------
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
