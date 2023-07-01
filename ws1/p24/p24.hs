import qualified Data.List     as L
import qualified System.Random as R

-- n must be >= 1 and <= upTo
getNRands :: (R.RandomGen g) => g -> Int -> Int -> [Int]
getNRands gen n upTo = take n $ L.nub $ R.randomRs (1, upTo) gen

getExampleInfo :: (R.RandomGen g) => g -> Int -> Int -> String
getExampleInfo gen n upTo =
  "Drawing " ++ show n ++ " numbers from 1 to " ++ show upTo ++ " => " ++
  show (getNRands gen n upTo)

main :: IO ()
main = do
  putStrLn "Lotto: Drawing N different random numbers from the set [1..M]"
  putStrLn "Examples:\n"
  gen <- R.newStdGen
  putStrLn $ getExampleInfo gen 6 49
  putStrLn $ getExampleInfo gen 2 10
  putStrLn "\nThat's all. Goodbye!"
