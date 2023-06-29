-- indexing starts at 0, sclicing is start - end (inclusive - inclusive)
-- start must be >= 0, end >= start
slice :: [a] -> Int -> Int -> [a]
slice xs start end = drop start $ take (end + 1) xs

getExampleInfo :: (Show a) => [a] -> Int -> Int -> String
getExampleInfo l s e =
  show l ++ " (" ++ show s ++ ":" ++ show e ++ ") => " ++ show (slice l s e)

main :: IO ()
main = do
  putStrLn "Slicing lists (0 based indexing, inclusing-inclusing)."
  putStrLn "Examples:\n"
  let l1 = ['a'..'j']
  let l2 = [1..12] :: [Int]
  let l3 = [1..4] :: [Int]
  putStrLn $ getExampleInfo l1 2 6
  putStrLn $ getExampleInfo l2 0 4
  putStrLn $ getExampleInfo l3 2 7
  putStrLn "\nThat's all. Goodbye!"
