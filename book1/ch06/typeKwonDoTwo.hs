-- case 1
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk f x y = (f x) == y
-- and now, e.g.:
-- chk (head) "ala" 'a'
-- or:
-- chk id 2 3
-- works just fine


-- case 2
arith :: Num b => (a -> b) -> Integer -> a -> b
arith f x y = f y
-- and now, e.g.:
-- arith (*2) (3 :: Integer) 4
-- or:
-- arith (+1) 1 3
-- works just fine
