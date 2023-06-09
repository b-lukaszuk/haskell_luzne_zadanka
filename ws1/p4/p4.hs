getLen :: [a] -> Int -> Int
getLen [] acc     = acc
getLen (_:xs) acc = getLen xs (acc + 1)

getLength :: [a] -> Int
getLength xs = getLen xs 0

getList :: Int -> [Int]
getList len
  | len <= 0 = []
  | otherwise = [1 .. len]

getExampleInfo :: (Show a) => [a] -> String
getExampleInfo l = show l ++ " => length: " ++ show (getLength l)

main :: IO ()
main = do
  let ls = map getList [0 .. 5]
  print "Getting length of a list examples"
  mapM_ (print . getExampleInfo) ls
