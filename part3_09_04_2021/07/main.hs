-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
-- nothing to import here


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
howMany :: Int
howMany = 15


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
sumFirst2elts :: [Int] -> Int
sumFirst2elts xs = sum $ take 2 xs

-- accepts fibonacci sequence in reverse order (bigger nums first from left)
getNextFib :: [Int] -> Int
getNextFib [] = 1
getNextFib [1] = 1
getNextFib xs = sumFirst2elts xs

getFib :: Int -> Int -> [Int] -> [Int]
getFib start stop fibSoFar =
  if start > stop
  then reverse fibSoFar
  else getFib (start+1) stop (getNextFib fibSoFar : fibSoFar)

getNfibNums :: Int -> [Int]
getNfibNums n = getFib 1 n []


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn $ "First " ++ show howMany ++ " Fibonacci numbers:"
  putStrLn $ show $ getNfibNums howMany
  putStrLn "That's it. Goodbye!"
