import           Numeric.Natural

-- from Section: 7.1 Problem

recSum :: (Num a) => [a] -> a
recSum []     = 0
recSum (x:xs) = x + recSum xs

-- uncomment and type the below into the ghci (REPL)
-- map recSum [[1], [1..3], [1..100]]


-- from Section: 7.2 Solution

-- short version: getFactorial n = product [1..n]
getFactorial' :: Natural -> Natural -> Natural
getFactorial' n acc
  | n <= 1 = acc
  | otherwise = getFactorial' (n-1) (acc*n)

getFactorial :: Natural -> Natural
getFactorial n = getFactorial' n 1

-- uncomment and type the below into the ghci (REPL)
-- map getFactorial [1..10]


getFib' :: Natural -> Natural -> Natural -> Natural
getFib' a b n
  | n < 1 = b
  | otherwise = getFib' b (b+a) (n-1)

getFib :: Natural -> Natural
getFib n = getFib' 1 0 n

-- uncomment and type the below into the ghci (REPL)
-- map getFib [0..19]
