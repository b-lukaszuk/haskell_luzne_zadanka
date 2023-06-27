rotate :: [a] -> Int -> [a]
rotate xs rot = drop modRot xs ++ take modRot xs
  where modRot = mod rot (length xs)

getExampleInfo :: (Show a) => [a] -> Int -> String
getExampleInfo l r =
  show l ++ " (rot " ++ show r ++ ") => " ++ show (rotate l r)

main :: IO ()
main = do
  putStrLn "Rotating lists by n elements."
  putStrLn "Examples:\n"
  let l1 = ['a'..'h']
  let l2 = ['a'..'h']
  let l3 = [1..5]
  let l4 = [1..4]
  putStrLn $ getExampleInfo l1 3
  putStrLn $ getExampleInfo l2 $ negate 2
  putStrLn $ getExampleInfo l3 0
  putStrLn $ getExampleInfo l3 5
  putStrLn $ getExampleInfo l4 5
  putStrLn $ getExampleInfo l4 $ negate 5
  putStrLn "\nThat's all. Goodbye!"
