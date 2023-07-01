import qualified Data.List     as L
import qualified System.Random as R

-- indices must be in range 1..length(xs) (inclusive..inclusive)
getInds :: [Int] -> [a] -> [a]
getInds inds xs = map snd $ filter (\(x, _) -> x `elem ` inds) $ zip [1..] xs

-- n must be >= 1 and <= upTo
getNRands :: (R.RandomGen g) => g -> Int -> Int -> [Int]
getNRands gen n upTo = take n $ L.nub $ R.randomRs (1, upTo) gen

-- n must be >= 1
randSelect :: (R.RandomGen g) => g -> [a] -> Int -> [a]
randSelect gen xs n = getInds (getNRands gen n (length xs)) xs

getExampleInfo :: (Show a, R.RandomGen g) => g -> Int -> [a] -> String
getExampleInfo gen n l =
  "Randomly selecting " ++ show n ++ " elt(s) from " ++ show l ++ " => " ++
  show (randSelect gen l n)

main :: IO ()
main = do
  putStrLn "Randomly selecting n elements from a list."
  putStrLn "Examples:\n"
  gen <- R.newStdGen
  let l1 = [1..10] :: [Int]
  let l2 = ['a'..'h']
  putStrLn $ getExampleInfo gen 1 l1
  putStrLn $ getExampleInfo gen 3 l2
  putStrLn "\nThat's all. Goodbye!"
