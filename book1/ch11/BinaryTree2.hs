module BinaryTree2 where

data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a)
  deriving (Eq, Ord, Show)

preorder :: BinaryTree a -> [a]
preorder tree = preorder' tree []

preorder' :: BinaryTree a -> [a] -> [a]
preorder' Leaf acc = acc
preorder' (Node left a right) acc = (a : acc) ++
   (preorder' left []) ++ (preorder' right [])

inorder :: BinaryTree a -> [a]
inorder tree = inorder' tree []

inorder' :: BinaryTree a -> [a] -> [a]
inorder' Leaf acc = acc
inorder' (Node left a right) acc = (inorder' left [])
  ++ (a : acc) ++ (inorder' right [])

postorder :: BinaryTree a -> [a]
postorder tree = postorder' tree []

postorder' :: BinaryTree a -> [a] -> [a]
postorder' Leaf acc = acc
postorder' (Node left a right) acc = (postorder' left []) ++
  (postorder' right []) ++ (a : acc)

testTree :: BinaryTree Integer
testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder = if preorder testTree == [2, 1, 3]
  then putStrLn "Preorder fine!"
  else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder = if inorder testTree == [1, 2, 3]
  then putStrLn "Inorder fine!"
  else putStrLn "Bad news bears."

testPostorder :: IO ()
testPostorder = if postorder testTree == [1, 3, 2]
  then putStrLn "Postorder fine!"
  else putStrLn "postorder failed check"

main :: IO ()
main = do
  testPreorder
  testInorder
  testPostorder
