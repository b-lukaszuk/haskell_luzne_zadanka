getKthElt :: Int -> [a] -> Maybe a
getKthElt _ [] = Nothing
getKthElt k (x:xs)
  | k <= 0 = Nothing
  | k == 1 = Just x
  | otherwise = getKthElt (k - 1) xs

getList :: Int -> [Int]
getList len
  | len <= 0 = []
  | otherwise = [1 .. len]

getExampleInfo :: (Show a) => Int -> [a] -> String
getExampleInfo k l =
  show l ++ " item " ++ show k ++ " => " ++ show (getKthElt k l)

main :: IO ()
main = do
  let ls = map getList [0 .. 5]
  print "Getting last two element of a list examples"
  mapM_ (print . getExampleInfo 3) ls
  print "That's all. Goodbye!"
