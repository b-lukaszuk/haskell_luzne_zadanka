fibs :: [Integer]
fibs = 1 : scanl (+) 1 fibs


-- case 1
firstNfibs :: Int -> [Integer]
firstNfibs n = take n fibs


-- case 2
allFibsBelow :: Integer -> [Integer]
allFibsBelow n = takeWhile (< n) fibs


-- case 3
-- https://en.wikipedia.org/wiki/Factorial
factorial :: [Integer]
factorial = scanl (*) 1 [1..] -- be careful, infinite list

firstNfacts :: Int -> [Integer]
firstNfacts n = take n factorial

allFactsBelow :: Integer -> [Integer]
allFactsBelow n = takeWhile (< n) factorial
