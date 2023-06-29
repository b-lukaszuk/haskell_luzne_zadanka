-- ind must be >= 0
insertAt :: a -> Int -> [a] -> [a]
insertAt elt _ []       = [elt]
insertAt elt 0 xs       = elt : xs
insertAt elt ind (x:xs) = x : insertAt elt (ind - 1) xs

getExampleInfo :: (Show a) => a -> Int -> [a] -> String
getExampleInfo elt ind l =
  "inserting " ++ show elt ++ " at position " ++ show ind ++ " in " ++ show l ++
  " => " ++ show (insertAt elt ind l)

main :: IO ()
main = do
  putStrLn "Inserting element in a list."
  putStrLn "Examples:\n"
  let l1 = ['a'..'c']
  let l2 = [1..5] :: [Int]
  putStrLn $ getExampleInfo 'z' 1 l1
  putStrLn $ getExampleInfo 'z' 5 l1
  putStrLn $ getExampleInfo 9 0 l2
  putStrLn $ getExampleInfo 9 4 l2
  putStrLn "\nThat's all. Goodbye!"
