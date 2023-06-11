getLast :: [a] -> Maybe a
getLast []     = Nothing
getLast [x]    = Just x
getLast (_:xs) = getLast xs

getLast' :: [a] -> Maybe a
getLast' xs =
  case xs of
    [] -> Nothing
    _  -> Just $ foldl1 (\_ x -> x) xs

getLast'' :: [a] -> Maybe a
getLast'' xs =
  case xs of
    [] -> Nothing
    _  -> Just $ foldr1 (\_ acc -> acc) xs

main :: IO ()
main = do
  let l1 = [1 .. 10] :: [Int]
  let l2 = [1 .. 5] :: [Int]
  let l3 = [] :: [Int]
  print "Getting last element of a list examples"
  print $ show l1 ++ " => " ++ show (getLast l1)
  print $ show l2 ++ " => " ++ show (getLast' l2)
  print $ show l3 ++ " => " ++ show (getLast'' l3)
  print "That's all. Goodbye!"
