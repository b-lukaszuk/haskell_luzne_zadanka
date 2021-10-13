data Tree a = Node (Tree a) a (Tree a)
            | Empty
              deriving (Eq, Ord, Show)

-- helper functions created by me for testing purposes
-- to help me understand the BinaryTrees
addBranch :: (Ord a) => a -> Tree a -> Tree a
addBranch x (Empty) = Node Empty x Empty
addBranch x (Node left y right) =
  if x < y
  then (Node (addBranch x left) y right)
  else if x > y
       then (Node left y (addBranch x right))
       else (Node left y right)

mkBinTree :: (Ord a) => [a] -> Tree a
mkBinTree xs = foldr (\x acc -> addBranch x acc) Empty xs

-- each tree (t1..t6) should have the height equal to the digit in its name
-- check it in ghci
t0 :: Tree Int
t0 = mkBinTree []

t1 :: Tree Int
t1 = mkBinTree [1]

t2 :: Tree Int
t2 = mkBinTree [6, 2, 5]

t3 :: Tree Int
t3 = mkBinTree [3, 2, 5]

t4 :: Tree Int
t4 = mkBinTree [3, 2, 5, 6, 1, 4]

t5 :: Tree Int
t5 = mkBinTree [1..5]

t6 :: Tree Int
t6 = mkBinTree [1..6]

-- is that it? it seems so
count :: Tree a -> Integer
count Empty = 0
count (Node left y right) = 1 + max (count left) (count right)

getHeight :: Tree a -> Integer
getHeight aTree = count aTree
