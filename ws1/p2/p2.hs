getLastTwo :: [a] -> Maybe [a]
getLastTwo []     = Nothing
getLastTwo [x, y] = Just [x, y]
getLastTwo (_:xs) = getLastTwo xs

getList :: Int -> [Int]
getList len
  | len <= 0 = []
  | otherwise = [1 .. len]

getExampleInfo :: (Show a) => [a] -> String
getExampleInfo l = show l ++ " => " ++ show (getLastTwo l)

main :: IO ()
main = do
  let ls = map getList [0 .. 5]
  print "Getting last two element of a list examples"
  mapM_ (print . getExampleInfo) ls
  print "That's all. Goodbye!"
