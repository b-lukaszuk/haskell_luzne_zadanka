group :: (Eq a) => a -> [[a]] -> [[a]]
group x [] = [[x]]
group x xs =
  if x == head (head xs)
    then (x : head xs) : drop 1 xs
    else [x] : xs

pack :: (Eq a) => [a] -> [[a]]
pack = foldr group []

getExampleInfo :: (Eq a, Show a) => [a] -> String
getExampleInfo l = show l ++ " => " ++ show (pack l)

main :: IO ()
main = do
  let l1 = ['a', 'a', 'a', 'a', 'b', 'c', 'c', 'a', 'a', 'd', 'e', 'e', 'f']
  let l2 = [1, 2, 2, 3, 4, 4, 5, 6, 6, 6, 7, 7] :: [Int]
  print "Packing consecutive duplicates of list elements into sublists."
  print "Examples:"
  print $ getExampleInfo l1
  print $ getExampleInfo l2
  print "That's all. Goodbye!"
