lastButOne :: [Int] -> Maybe Int
lastButOne [] = Nothing
lastButOne (_:[]) = Nothing
lastButOne (_:x:_:[]) = Just x
lastButOne (_:xs) = lastButOne xs

main :: IO()
main = do
  putStrLn "Testing lastButOne function"
  putStr "lastButOne [] = "
  putStrLn $ show $ lastButOne []
  putStrLn "lastButOne [1]"
  putStrLn $ show $ lastButOne [1]
  putStrLn "lastButOne [1, 2]"
  putStrLn $ show $ lastButOne [1, 2]
  putStrLn "lastButOne [1, 2, 3]"
  putStrLn $ show $ lastButOne [1, 2, 3]
  putStrLn "lastButOne [1..100]"
  putStrLn $ show $ lastButOne [1..100]
  putStrLn "That's it. Goodbye."
