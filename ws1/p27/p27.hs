getCombs :: [a] -> [[a]]
getCombs [] = [[]]
getCombs (x:xs) = combXs ++ map (x:) combXs
  where combXs = getCombs xs

getCombsOfLen :: Int -> [a] -> [[a]]
getCombsOfLen len xs = filter (\x -> length x == len) $ getCombs xs

-- without using Data.Set functionality
intersect' :: (Eq a) => [a] -> [a] -> [a] -> [a]
intersect' [] _ acc      = acc
intersect' _ [] acc      = acc
intersect' (x:xs) ys acc = if x `elem` ys
  then intersect' xs ys (x:acc)
  else intersect' xs ys acc

intersect :: (Eq a) => [a] -> [a] -> [a]
intersect xs ys = intersect' xs ys []

areDisjointSets :: (Eq a) => [a] -> [a] -> Bool
areDisjointSets xs ys = commonLen <= 0
  where commonLen = length (xs `intersect` ys)

-- getExampleInfo :: (Show a) => Int -> [a] -> String
-- getExampleInfo len xs =
--   "Combinations of length " ++ show len ++ " from " ++ show xs ++ " => " ++
--   show (getCombsOfLen len xs)

main :: IO ()
main = do
  -- putStrLn "Generating combinations a list elements."
  -- putStrLn "Examples:\n"
  -- let l1 = [5..7] :: [Int]
  -- let l2 = ['a'..'d']
  -- putStrLn $ getExampleInfo 2 l1
  -- putStrLn $ getExampleInfo 3 l2
  putStrLn "Work in progress."
  putStrLn "\nThat's all. Goodbye!"
