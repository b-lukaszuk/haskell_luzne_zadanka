-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import System.Random
import Data.List (union)

-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums ::  [Int]
nums = [1, 6, 23, 8, 4, 8, 3, 7]

-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- as far as I know haskell is functional, so no changes inplace

-- returns unique elts from a list
unique :: (Eq a) => [a] -> [a]
unique lst = union [] lst

-- returns list of all Ints from a range
-- the list of all Ints is in random order and w/o repetitions
getRandIntsInRange :: (RandomGen g) => g -> Int -> Int -> [Int]
getRandIntsInRange gen fromIncl toExcl =
  let lstLen = toExcl - fromIncl
  in take lstLen $ unique $ randomRs (fromIncl, toExcl-1) gen

-- accepts two lists: lst and indexes
-- gets list of elements at specific indexes
getEltsByIds :: [a] -> [Int] -> [a]
getEltsByIds [] _ = []
getEltsByIds _ [] = []
getEltsByIds lst (ind:inds) = lst !! ind : getEltsByIds lst inds

-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  gen <- getStdGen
  let randomInds = getRandIntsInRange gen 0 $ length nums
      permutedList = getEltsByIds nums randomInds
  putStrLn $ "Initial list: " ++ show nums
  putStrLn $ "Randomly permuted list: " ++ show permutedList

-- alternatywa
-- funkcja permutations z Data.List
-- zwraca liste list (wszystkie mozliwe permutacje)
-- z ktorej bierzemy losowy element
