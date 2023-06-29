-- requirement n >= 1, n >= c
delEveryNElt' :: Int -> Int -> [a] -> [a] -> [a]
delEveryNElt' _ _ [] acc = reverse acc
delEveryNElt' n c (x:xs) acc
  | c == 1 = delEveryNElt' n n xs acc
  | otherwise = delEveryNElt' n (c-1) xs (x:acc)

-- requirement n >= 1
delEveryNElt :: Int -> [a] -> [a]
delEveryNElt n xs = delEveryNElt' n n xs []

getExampleInfo :: (Show a) => Int -> [a] -> String
getExampleInfo n l =
  show l ++ " del every " ++ show n ++ " elt => " ++ show (delEveryNElt n l)

main :: IO ()
main = do
  putStrLn "Deliting every n-th element of a list."
  putStrLn "Examples:\n"
  let l1 = ['a'..'k']
  let l2 = [1..12] :: [Int]
  putStrLn $ getExampleInfo 2 l1
  putStrLn $ getExampleInfo 3 l2
  putStrLn "\nThat's all. Goodbye!"
