-- OK, I will solve it without using haskell's [1..5] syntax
range :: Int -> Int -> [Int]
range start end
  | start == end = [start]
  | start < end = start : range (start + 1) end
  | otherwise = start : range (start - 1) end

getExampleInfo :: Int -> Int -> String
getExampleInfo start end =
  "range " ++ show start ++ " to " ++ show end ++ " => " ++ show (range start end)

main :: IO ()
main = do
  putStrLn "Creating lists of integers with ranges."
  putStrLn "Examples:\n"
  putStrLn $ getExampleInfo 1 5
  putStrLn $ getExampleInfo 13 19
  putStrLn $ getExampleInfo 19 9
  putStrLn $ getExampleInfo 101 111
  putStrLn $ getExampleInfo (negate 8) 2
  putStrLn $ getExampleInfo 2 (negate 3)
  putStrLn "\nThat's all. Goodbye!"
