data Tree a = Node a (Maybe (Tree a)) (Maybe (Tree a)) deriving (Show)

-- simple tests of the type
tr1 :: Tree Integer
tr1 = Node 3 Nothing Nothing

tr2 :: Tree Integer
tr2 = Node 3 Nothing (Just (Node 4 Nothing Nothing))

tr3 :: Tree Integer
tr3 = Node 3 (Just (Node 2 Nothing Nothing)) (Just (Node 4 Nothing Nothing))

tr4 :: Tree Integer
tr4 = Node 3
  (Just (Node 2 (Just (Node 1 Nothing Nothing)) Nothing))
  (Just (Node 4 Nothing Nothing))

main :: IO()
main = do
  putStrLn "Testing <<Tree a>> type.\n"
  putStrLn $ show tr1
  putStrLn $ show tr2
  putStrLn $ show tr3
  putStrLn $ show tr4

  putStrLn ""
  putStrLn "It appears to be working fine."
  putStrLn ""
  putStrLn "That's all. Goodbye."
