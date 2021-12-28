module Task2 where

import System.Random
import Text.Printf (printf)

type Prisoner = Int
type Card = Int

prisoners :: [Prisoner]
prisoners = [0..9]

noOfGuessesPerPris :: Int
noOfGuessesPerPris = 8

noOfIter :: Integer
noOfIter = 10000

getRndCards :: IO [Card]
getRndCards = do
  gen <- getStdGen
  _ <- newStdGen
  return $ take noOfGuessesPerPris $ randomRs (0, length(prisoners) - 1) gen

isAnyCardEqlPrisId :: Int -> [Card] -> Bool
isAnyCardEqlPrisId _ [] = False
isAnyCardEqlPrisId prisId (card:cards) = if card == prisId then True
                                         else isAnyCardEqlPrisId prisId cards

makePrisLookForLuckyCard :: [Prisoner] -> [IO Bool]
makePrisLookForLuckyCard [] = []
makePrisLookForLuckyCard (p:ps) = fmap (isAnyCardEqlPrisId p) getRndCards :
                                  makePrisLookForLuckyCard ps

didAllPrisFoundLuckyCard :: [IO Bool] -> IO Bool
didAllPrisFoundLuckyCard [] = return True
didAllPrisFoundLuckyCard (result:results) = do
  res <- result
  if not res then return False else didAllPrisFoundLuckyCard results

runNIterRand :: Integer -> [IO Bool]
runNIterRand 0 = []
runNIterRand n = didAllPrisFoundLuckyCard (makePrisLookForLuckyCard prisoners) :
  runNIterRand (n-1)

calcProb :: Integer -> Integer -> [IO Bool] -> IO Double
calcProb noOfSuc total [] = return ((fromIntegral noOfSuc) / (fromIntegral total))
calcProb noOfSuc total (b:bs) = do
  res <- b
  if res
    then calcProb (noOfSuc + 1) (total + 1) bs
    else calcProb noOfSuc (total + 1) bs

-- interesting,
-- calculation of probability in Haskell's REPL is faster than in
-- Python's REPL, ofcourse the results are similar
main :: IO ()
main = do
    putStrLn "Calculating probability of success for:"
    putStrLn "10 prisoners, 10 cards, 8 guesses each,"
    putStrLn "strategy: random, iterations: 10k"
    putStrLn "Please be patient, this may take a while"
    probRand <- calcProb 0 0 $runNIterRand noOfIter
    printf "p = %.5f\n" $ probRand
