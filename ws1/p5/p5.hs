-------------------------------------------------------------------------------
--                      classical version with recursion                     --
-------------------------------------------------------------------------------
-- revList' :: [a] -> [a] -> [a]
-- revList' [] acc     = acc
-- revList' (x:xs) acc = revList' xs (x : acc)

-- revList :: [a] -> [a]
-- revList l = revList' l []

-------------------------------------------------------------------------------
--                             version with foldl                            --
-------------------------------------------------------------------------------
revList2 :: [a] -> [a]
-- the code below is shorter equivalent of
-- revList2 = foldl (\acc cur -> cur : acc) []
revList2 = foldl (flip (:)) []

getList :: Int -> [Int]
getList len
  | len <= 0 = []
  | otherwise = [1 .. len]

getExampleInfo :: (Show a) => [a] -> String
getExampleInfo l = show l ++ " => " ++ show (revList2 l)

main :: IO ()
main = do
  let ls = map getList [0 .. 5]
  print "Reversing a list examples"
  mapM_ (print . getExampleInfo) ls
