-- case 1
myOr :: [Bool] -> Bool
myOr xs = foldr (\cur acc -> if cur then cur else acc) False xs


-- case 2
myAny :: (a -> Bool) -> [a] -> Bool
myAny f xs = foldr (\cur acc -> if f cur then True else acc) False xs


-- case 3
myElem :: Eq a => a -> [a] -> Bool
myElem y xs = foldr (\cur acc -> if y == cur then True else acc) False xs


-- case 4
myReverse :: [a] -> [a]
myReverse xs = foldl (\acc cur -> cur : acc) [] xs


-- case 5
myMap :: (a -> b) -> [a] -> [b]
myMap f xs = foldr (\cur acc -> f cur : acc) [] xs


-- case 6
myFilter :: (a -> Bool) -> [a] -> [a]
myFilter f xs = foldr (\cur acc -> if f cur then cur : acc else acc) [] xs


-- case 7
mySquish :: [[a]] -> [a]
mySquish xs = foldr (\cur acc -> cur ++ acc) [] xs


-- case 8
mySquishMap :: (a -> [b]) -> [a] -> [b]
mySquishMap f xs = mySquish $ myMap f xs
