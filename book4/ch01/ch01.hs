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
