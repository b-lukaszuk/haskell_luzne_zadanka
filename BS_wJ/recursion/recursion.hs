-- from Section: 7.1 Problem

recSum :: (Num a) => [a] -> a
recSum []     = 0
recSum (x:xs) = x + recSum xs

-- uncomment and type the below into the ghci (REPL)
-- map recSum [[1], [1..3], [1..100]]
