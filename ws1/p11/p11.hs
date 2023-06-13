data OneMany a = One a | Many {count::Int, val::a} deriving Show

group :: (Eq a) => a -> [OneMany a] -> [OneMany a]
group y [] = [One y]
group y l@(One x:xs)
  | y == x = Many {count=2, val=y} : xs
  | otherwise = One y : l
group y l@(Many c v:xs)
  | y == v = Many {count=c+1, val=v} : xs
  | otherwise = One y : l

encodeRunLength :: (Eq a) => [a] -> [OneMany a]
encodeRunLength = foldr group []

getExampleInfo :: (Eq a, Show a) => [a] -> String
getExampleInfo l = show l ++ " =>\n" ++ show (encodeRunLength l)

main :: IO ()
main = do
  let l1 = [True, True, True, False, False, True, False, False, False, False]
  let l2 = [1, 2, 2, 3, 4, 4, 5, 6, 6, 6, 7, 7] :: [Int]
  putStrLn "Packing consecutive duplicates of list elements into sublists."
  putStrLn "Examples:"
  putStrLn $ getExampleInfo l1
  putStrLn $ getExampleInfo l2
  putStrLn "That's all. Goodbye!"
