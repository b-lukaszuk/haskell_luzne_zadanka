import System.Environment

getInt :: String -> Int
getInt strNum = read strNum

main :: IO ()
main = do
  args <- getArgs
  putStrLn "Hello there!\n"
  putStr "Your input was: "
  putStrLn $ show args
  putStr "Sum of the first two args = "
  putStrLn $ show $ sum $ take 2 $ map getInt args
  putStrLn "\nThat's all. Goodbye!"
