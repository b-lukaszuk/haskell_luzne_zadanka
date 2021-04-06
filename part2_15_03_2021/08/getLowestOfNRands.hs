-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import System.Random


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums ::  [Int]
nums = [1, 6, 23, 8, 4, 8, 3, 7]

howManyElts :: Int
howManyElts = 4


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- accepts two lists: lst and indexes
-- gets list of elements at specific indexes
getEltsByIds :: [a] -> [Int] -> [a]
getEltsByIds [] _ = []
getEltsByIds _ [] = []
getEltsByIds lst (ind:inds) = lst !! ind : getEltsByIds lst inds

-- gets a list of n rand elts from a list
-- draws with replacement
getNrandElts :: RandomGen g => g -> [a] -> Int -> [a]
getNrandElts _ _ 0 = []
getNrandElts gen lst howMany =
  let randInds = take howMany $ randomRs (0, length lst - 1) gen
  in getEltsByIds lst randInds


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  gen <- getStdGen
  let randomElts = getNrandElts gen nums howManyElts
  putStrLn $ "Initial list: " ++ show nums
  putStr $ "The list of its " ++ show howManyElts ++ " random elements: "
  putStrLn $ show randomElts
  putStr "The lowest value of the random elements is: "
  putStrLn $ show $ minimum randomElts
