import qualified System.Random as R

-- https://programming-idioms.org/idiom/10/shuffle-a-list/826/haskell
-- modified by me
shuffle :: [a] -> IO [a]
shuffle xs = if length xs < 2 then return xs else do
  i <- R.randomRIO (0, length xs - 1)
  r <- shuffle (take i xs ++ drop (i+1) xs)
  return (xs !! i : r)

getExampleInfo :: (Show a) => [a] -> [a] -> String
getExampleInfo l permL =
  "Random permutation of " ++ show l ++ " => " ++
  show permL

main :: IO ()
main = do
  putStrLn "Getting random permutation of a list."
  putStrLn "Examples:\n"
  let l1 = [1..5] :: [Int]
  pL1 <- shuffle l1
  let l2 = ['a'..'h']
  pL2 <- shuffle l2
  putStrLn $ getExampleInfo l1 pL1
  putStrLn $ getExampleInfo l2 pL2
  putStrLn "\nThat's all. Goodbye!"
