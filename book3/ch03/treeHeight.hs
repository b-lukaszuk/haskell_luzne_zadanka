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

t1 :: Tree Int
t1 = mkBinTree []

t2 :: Tree Int
t2 = mkBinTree [3, 2, 5]

t3 :: Tree Int
t3 = mkBinTree [3, 2, 5, 6]

t4 :: Tree Int
t4 = mkBinTree [3, 2, 5, 6, 1, 4]
