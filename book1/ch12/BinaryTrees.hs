module BinaryTrees where

data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

-- helper functions created by me for testing purposes
-- to help me understand the BinaryTrees
addBranch :: (Ord a) => a -> BinaryTree a -> BinaryTree a
addBranch x (Leaf) = Node Leaf x Leaf
addBranch x (Node left y right) =
  if x < y
  then (Node (addBranch x left) y right)
  else if x > y
       then (Node left y (addBranch x right))
       else (Node left y right)

mkBinTree :: (Ord a) => [a] -> BinaryTree a
mkBinTree xs = foldr (\x acc -> addBranch x acc) Leaf xs

testTree :: BinaryTree Int
testTree = mkBinTree [3, 2, 5, 6, 1, 4]


-- case 1
-- again what a strange function
-- some example of usage would be really helpful to write it down
-- and to check its functioning, I guess I just kind of modify the myUnfoldr
-- from previous exercise + a peak from the internet
unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold fn x =
  case fn x of
    Nothing -> Leaf
    Just (left, z, right) -> (Node (unfold fn left) z (unfold fn right))
-- now, how to test it, its gonna produce infinitely nested BinaryTree
-- I cannot just use, e.g. take 5 $ unfold (\x -> Just (x, x+1, x)) 0
-- still, I'm not quite sure how this function works and why it's useful
-- why not just use, say:
-- mkBinTree (that I created above) with iterate (previous exercise)
-- iterate will provide the desired list, and mkBinTree will
-- produce the desired BinaryTree


-- case 2
integerToMaybe :: Integer -> Maybe (Integer, Integer, Integer)
integerToMaybe x = if x <= 0 then Nothing else Just (x - 1, x - 1, x - 1)

treeBuild :: Integer -> BinaryTree Integer
treeBuild n = unfold integerToMaybe n
-- it builds a tree but kindof in an opposite direction
-- (not sure how to reverse it)
-- ok, I'll leave it here, this exercise is strange
-- and I don't fully understand it anyway
-- maybe, one day when it will sink through I'll get back to it and correct it
