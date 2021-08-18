-- case 1
eftBool :: Bool -> Bool -> [Bool]
eftBool x y = if x > y then []
  else if x == y then [x] else [x, y]
-- works the same as: enumFromTo Bool Bool


-- case 2
eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd x y = if x > y then []
  else if x == y then [x] else x : eftOrd (succ x) y


-- case 3
eftInt :: Int -> Int -> [Int]
eftInt x y = if x > y then []
  else if x == y then [x] else x : eftInt (succ x) y


-- case 4
eftChar :: Char -> Char -> [Char]
eftChar x y = if x > y then []
  else if x == y then [x] else x : eftChar (succ x) y
