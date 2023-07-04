getCombs :: [a] -> [[a]]
getCombs [] = [[]]
getCombs (x:xs) = combXs ++ map (x:) combXs
  where combXs = getCombs xs

getCombsOfLen :: Int -> [a] -> [[a]]
getCombsOfLen len xs = filter (\x -> length x == len) $ getCombs xs

getExampleInfo :: (Show a) => Int -> [a] -> String
getExampleInfo len xs =
  "Combinations of length " ++ show len ++ " from " ++ show xs ++ " => " ++
  show (getCombsOfLen len xs)

main :: IO ()
main = do
  putStrLn "Generating combinations a list elements."
  putStrLn "Examples:\n"
  let l1 = [5..7] :: [Int]
  let l2 = ['a'..'d']
  putStrLn $ getExampleInfo 2 l1
  putStrLn $ getExampleInfo 3 l2
  putStrLn "\nThat's all. Goodbye!"
