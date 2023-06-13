group :: (Eq a) => a -> [(Int, a)] -> [(Int, a)]
group y [] = [(1, y)]
group y (x:xs) =
  if y == snd x
    then (fst x + 1, snd x) : xs
    else (1, y) : x : xs

encodeRunLength :: (Eq a) => [a] -> [(Int, a)]
encodeRunLength = foldr group []

getExampleInfo :: (Eq a, Show a) => [a] -> String
getExampleInfo l = show l ++ " =>\n" ++ show (encodeRunLength l)

main :: IO ()
main = do
  let l1 = [True, True, True, False, False, True, False, False, False, False]
  let l2 = [1, 2, 2, 3, 4, 4, 5, 6, 6, 6, 7, 7] :: [Int]
  putStrLn "Run-length encoding of a list."
  putStrLn "Examples:\n"
  putStrLn $ getExampleInfo l1
  putStrLn $ "\n" ++ getExampleInfo l2
  putStrLn "\nThat's all. Goodbye!"
