module Task4 where

import System.Random
import Text.Printf (printf)
import Data.List (group, sort)

type BDay = Int

daysInYear :: BDay
daysInYear = 365

noOfPeopleAtParty :: Int
noOfPeopleAtParty = 30

noOfIters :: Integer
noOfIters = 100000

getPeopleAtParty :: Int -> IO [BDay]
getPeopleAtParty n = do
  gen <- getStdGen
  _ <- newStdGen
  return $ take n $ randomRs (1, daysInYear) gen

getCounts :: [BDay] -> [Int]
getCounts bDays = map length $ group $ sort bDays

anyGT1 :: [Int] -> Bool
anyGT1 [] = False
anyGT1 (i:is) = if i > 1 then True else anyGT1 is

anySameBDays :: [Int] -> Bool
anySameBDays bDays = anyGT1 $ getCounts bDays

sumBool :: [Bool] -> Integer
sumBool lstOfBool = foldr (\cur acc -> if cur then acc+1 else acc) 0 lstOfBool

avgBool :: [Bool] -> Double
avgBool lstOfBool = let noOfTrue = sumBool lstOfBool
  in (fromIntegral noOfTrue) / (fromIntegral $ length lstOfBool)

runNIters :: Integer -> [Bool] -> IO [Bool]
runNIters 0 acc = return acc
runNIters n acc = do
  ppl <- getPeopleAtParty noOfPeopleAtParty
  runNIters (n - 1) ((anySameBDays ppl) : acc)

-- interesting, for Task2 my solution in Haskell was faster than in Python
-- here (Task4) my solution in Python is faster than in Haskell
-- Python: 0.115 secs for 10k iters, 0.879 secs for 100k iters
-- Haskell: 0.421 secs for 10k iters, 2.184 secs for 100k iters
main :: IO ()
main = do
  putStrLn "===="
  putStrLn "Calculating probability of success for:"
  putStrLn "at least 2 people at a party celebrating their b-days the same day"
  printf "number of people at the party: %d\n" noOfPeopleAtParty
  printf "number of iterations: %d\n" noOfIters
  putStrLn "Please be patient this may take a while"
  resOfTrials <- runNIters noOfIters []
  printf "p = %.5f\n" $ avgBool resOfTrials
  putStrLn "===="
  putStrLn "That's all. Goodbye."
