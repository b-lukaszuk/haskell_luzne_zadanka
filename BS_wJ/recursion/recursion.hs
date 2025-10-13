-- from Section: 7.1 Problem

recSum :: (Num a) => [a] -> a
recSum []     = 0
recSum (x:xs) = x + recSum xs

-- uncomment and type the below into the ghci (REPL)
-- map recSum [[1], [1..3], [1..100]]

-- short version: getFactorial n = product [1..n]
getFactorial' :: Int -> Int -> Int
getFactorial' n acc
  | n < 1 = undefined
  | n == 1 = acc
  | otherwise = getFactorial' (n-1) (acc*n)

getFactorial :: Int -> Int
getFactorial n = getFactorial' n 1

-- uncomment and type the below into the ghci (REPL)
-- map getFactorial [1..10]
