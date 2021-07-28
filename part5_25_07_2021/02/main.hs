myElem :: (Eq a) => a -> [a] -> Bool
myElem _ [] = False
myElem y (x:xs) = if y == x then True else myElem y xs

nub :: (Eq a) => [a] -> [a]
nub [] = []
nub (x:xs) = if myElem x xs then nub xs else x : (nub xs)

isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [x] = True
isAsc (x:y:xs) = if x < y then isAsc (y:xs) else False

graph :: [(Int, Int)]
graph = [(1, 2), (2, 3), (3, 2), (4, 3), (4, 5)]

hasPath :: [(Int, Int)] -> Int -> Int -> Bool
