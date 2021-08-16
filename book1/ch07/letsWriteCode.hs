-- case 1
-- a)
tensDigit :: Integral a => a -> a
tensDigit x = d
    where xLast = fst $ divMod x 10
          d = snd $ divMod xLast 10

-- c)
hunsD :: Integral a => a -> a
hunsD x = d
    where xLast = fst $ divMod x 100
          d = snd $ divMod xLast 10


-- case 2
-- a) case expression
foldBool :: a -> a -> Bool -> a
foldBool x y z = case z of
  True -> y
  False -> x

-- b) guards
foldBool' :: a -> a -> Bool -> a
foldBool' x y z
  | z = y
  | otherwise = x


-- case 3
g :: (a -> b) -> (a, c) -> (b, c)
g f (x, y) = (f x, y)
