import Data.List (sortBy)

-- sort
sortByLength :: [[a]] -> Bool -> [[a]]
sortByLength xs asc = if asc
  then sortBy (\l1 l2 -> compare (length l1) (length l2)) xs
  else sortBy (\l1 l2 -> compare (length l2) (length l1)) xs

lst1 :: [[Int]]
lst1 = [reverse [1..6], [1..4], [1..2], reverse [1..3], [1..5]]

main :: IO()
main = do
  putStrLn $ "Sorting list " ++ show lst1 ++ "(asc by length of sublists): "
  putStrLn ""
  putStrLn $ show $ sortByLength lst1 True
  putStrLn ""
  putStrLn $ "Sorting list " ++ show lst1 ++ "(dsc by length of sublists): "
  putStrLn ""
  putStrLn $ show $ sortByLength lst1 False
  putStrLn ""
  putStrLn "That's all! Goodbye!"
