addIfNotInHead :: (Eq a) => a -> [a] -> [a]
addIfNotInHead x [] = [x]
addIfNotInHead x xs =
  if x /= head xs
    then x : xs
    else xs

remDupl :: (Eq a) => [a] -> [a]
remDupl = foldr addIfNotInHead []

getExampleInfo :: (Eq a, Show a) => [a] -> String
getExampleInfo l = show l ++ " => " ++ show (remDupl l)

main :: IO ()
main = do
  let l1 =
        ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'e', 'e']
  let l2 = [1, 2, 2, 3, 4, 4, 5, 6, 6, 6, 7, 7] :: [Int]
  print "Removing consecutive duplicates from list examples"
  print $ getExampleInfo l1
  print $ getExampleInfo l2
  print "That's all. Goodbye!"
