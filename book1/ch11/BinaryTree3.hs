module BinaryTree3 where

data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

testTree :: BinaryTree Integer
testTree = Node (Node (Node Leaf 0 Leaf) 1 Leaf)
           2
           (Node Leaf 3 (Node Leaf 4 Leaf))

-- any traversal order is fine
foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
foldTree _ acc Leaf = acc
foldTree f acc (Node left a right) =
  let leftBranch = foldTree f acc left
      center = f a leftBranch
  in foldTree f center right
-- hmm, but how to test it now?
