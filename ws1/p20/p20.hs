-- n must be >= 0
removeAt :: Int -> [a] -> [a]
removeAt _ []     = []
removeAt 0 (_:xs) = xs
removeAt n (x:xs) = x : removeAt (n - 1) xs

getExampleInfo :: (Show a) => Int -> [a] -> String
getExampleInfo ind l =
  show l ++ " (rem elt at ind " ++ show ind ++ ") => " ++ show (removeAt ind l)

main :: IO ()
main = do
  putStrLn "Removing elt from a list."
  putStrLn "Examples:\n"
  let l1 = ['a'..'c']
  let l2 = [1..5] :: [Int]
  putStrLn $ getExampleInfo 1 l1
  putStrLn $ getExampleInfo 5 l1
  putStrLn $ getExampleInfo 0 l2
  putStrLn $ getExampleInfo 4 l2
  putStrLn "\nThat's all. Goodbye!"
