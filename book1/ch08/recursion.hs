-- case 2
sum1toN :: (Eq a, Num a) => a -> a
sum1toN 0 = 0
sum1toN n = n + sum1toN (n-1)

sum1toN' :: (Eq a, Num a) => a -> a
sum1toN' n = sumUp 1 n 0
  where sumUp from upto acc
          | from == upto = (acc + from)
          | otherwise = sumUp (from + 1) upto (acc + from)


-- case 3
mult :: (Integral a) => a -> a -> a
mult x y = mult' x y 0
  where mult' x' y' acc
          | y' == 0 = acc
          | otherwise = mult' x' (y'-1) (acc + x')
