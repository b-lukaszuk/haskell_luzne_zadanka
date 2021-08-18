mySqr :: [Integer]
mySqr = [x^2 | x <- [1..5]]

myCube :: [Integer]
myCube = [x^3 | x <- [1..5]]


-- case 1
tuples1 :: [(Integer, Integer)]
tuples1 = [(x, y) | x <- mySqr, y <- myCube]


-- case 2
tuples2 :: [(Integer, Integer)]
tuples2 = [(x, y) | x <- mySqr, y <- myCube, x < 50, y < 50]


-- case 3
howManyTuples1 :: Int
howManyTuples1 = length tuples1

howManyTuples2 :: Int
howManyTuples2 = length tuples2
