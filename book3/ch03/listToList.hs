data List a = Cons a (List a) | Nil deriving (Show)

-- this fn is not required by the task, still I wanted to write it
hsListToList :: [a] -> List a
hsListToList [] = Nil
hsListToList (x:xs) = Cons x $ hsListToList xs

listToHsList :: List a -> [a]
listToHsList Nil = []
listToHsList (Cons x xs) = x : listToHsList xs

-- standard lists in Haskell
hsL1 :: [Int]
hsL1 = []

hsL2 :: [Int]
hsL2 = [1]

hsL3 :: [Int]
hsL3 = [1,2]

hsL4 :: [Int]
hsL4 = [1..4]

hsL5 :: [Int]
hsL5 = [1..4]

-- the defined lists
lsL1 :: List Int
lsL1 = Nil

lsL2 :: List Int
lsL2 = (Cons 1 Nil)

lsL3 :: List Int
lsL3 = (Cons 1 (Cons 2 Nil))

lsL4 :: List Int
lsL4 = (Cons 1 (Cons 2 (Cons 3 (Cons 4 Nil))))

lsL5 :: List Int
lsL5 = (Cons 4 (Cons 3 (Cons 2 (Cons 1 Nil))))

main :: IO()
main = do
  putStrLn "Testing list converters.\n"
  putStr $ concat ["hsListToList ", show hsL1, " = "]
  putStrLn $ show $ hsListToList hsL1
  putStr $ concat ["hsListToList ", show hsL2, " = "]
  putStrLn $ show $ hsListToList hsL2
  putStr $ concat ["hsListToList ", show hsL3, " = "]
  putStrLn $ show $ hsListToList hsL3
  putStr $ concat ["hsListToList ", show hsL4, " = "]
  putStrLn $ show $ hsListToList hsL4
  putStr $ concat ["hsListToList ", show hsL5, " = "]
  putStrLn $ show $ hsListToList hsL5

  putStrLn ""
  putStr $ concat ["listToHsList (", show lsL1, ") = "]
  putStrLn $ show $ listToHsList lsL1
  putStr $ concat ["listToHsList (", show lsL2, ") = "]
  putStrLn $ show $ listToHsList lsL2
  putStr $ concat ["listToHsList (", show lsL3, ") = "]
  putStrLn $ show $ listToHsList lsL3
  putStr $ concat ["listToHsList (", show lsL4, ") = "]
  putStrLn $ show $ listToHsList lsL4
  putStr $ concat ["listToHsList (", show lsL5, ") = "]
  putStrLn $ show $ listToHsList lsL5

  putStrLn ""
  putStrLn "That's all. Goodbye."
