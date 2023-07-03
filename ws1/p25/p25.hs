-- import qualified Data.List     as L
import qualified System.Random as R

-- solution based on p24 ---
-- -- n must be >= 1 and <= upTo
-- getNRands :: (R.RandomGen g) => g -> Int -> Int -> [Int]
-- getNRands gen n upToExcl = take n $ L.nub $ R.randomRs (0, upToExcl - 1) gen

-- -- inds must be from 0 to (length xs) - 1
-- getEltsAtInds :: [Int] -> [a] -> [a]
-- getEltsAtInds inds xs = map (\ind -> xs !!ind) inds

-- shuffle' :: (R.RandomGen g) => g -> [a] -> [a]
-- shuffle' g xs = getEltsAtInds (getNRands g len len) xs
--   where len = length xs
-- solution based on p24 ---

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
