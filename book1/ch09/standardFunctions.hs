myAnd :: [Bool] -> Bool
myAnd [] = True -- for me more logical would be False like in Common Lisp
myAnd (x:xs) = if x then myAnd xs else False

myOr :: [Bool] -> Bool
myOr [] = False
myOr (x:xs) = if x then True else myOr xs

myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny predicate (x:xs) = if predicate x then True else myAny predicate xs

myReverse :: [a] -> [a]
myReverse [] = []
myReverse xs = myReverse' xs []

myReverse' :: [a] -> [a] -> [a]
myReverse' [] acc = acc
myReverse' (x:xs) acc = myReverse' xs (x : acc)

-- squish flattens list of lists
mySquish :: [[a]] -> [a]
mySquish [] = []
mySquish (x:xs) = x ++ mySquish xs

-- squishMap - maps a function over a list and concatenates the results
mySquishMap :: (a -> [b]) -> [a] -> [b]
mySquishMap f [] = []
mySquishMap f (x:xs) = f x ++ mySquishMap f xs

myMax :: (Ord a) => a -> a -> a
myMax x y = case compare x y of
  LT -> y
  _ -> x

-- non safe
myMaximum :: (Ord a) => [a] -> a
myMaximum [] = error "Cannot return maximum of an empty list"
myMaximum (x:xs) = if null xs then x else myMax x (myMaximum xs)
