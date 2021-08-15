-- case a
addOneIfOdd :: Integral a => a -> a
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f = \n -> n + 1


-- case b
addFive :: (Num a, Ord a) => a -> a -> a
addFive = \x y -> (if x > y then y else x) + 5


-- case c
mfilp :: (a -> b -> c) -> b -> a -> c
mfilp f x y = f y x
