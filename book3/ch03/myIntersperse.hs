myIntersperse :: a -> [[a]] -> [a]
myIntersperse _ [] = []
myIntersperse _ [x] = x
myIntersperse y (x:xs) = x ++ [y] ++ myIntersperse y xs

l1 :: [String]
l1 = ["ala", "ma", "kota"]

sep1 :: Char
sep1 = ' '

l2 :: [[Int]]
l2 = [[1..3], [5..8]]

sep2 :: Int
sep2 = 4

main :: IO ()
main = do
  putStrLn "Testing myIntersperse function."
  putStrLn ""
  putStrLn $ "myIntersperse " ++ show sep1 ++ " " ++ show l1
  putStrLn $ myIntersperse sep1 l1
  putStrLn ""
  putStrLn $ "myIntersperse " ++ show sep2 ++ " " ++ show l2
  putStrLn $ show $ myIntersperse sep2 l2
  putStrLn ""
  putStrLn "That's all. Goodbye!"
