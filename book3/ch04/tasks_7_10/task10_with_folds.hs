myAny :: (a -> Bool) -> [a] -> Bool
myAny pred xs = foldr (\cur acc -> if pred cur then True else acc) False xs

myCycle :: [a] -> [a]
myCycle [] = error "empty list"
myCycle xs = foldr (\cur acc -> xs ++ acc) (myCycle xs) xs

myWords :: String -> [String]
myWords xs = foldr
  (\cur acc -> if cur /= ' ' then (cur : head acc) : tail acc else [] : acc)
  [[]] xs

myUnlines :: [String] -> String
myUnlines xs = foldr (\cur acc -> cur ++ "\n" ++ acc) [] xs
