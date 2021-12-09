module Task2 where

import System.Random

type Prisoner = Int
type Card = Int

prisoners :: [Prisoner]
prisoners = [0..9]

noOfGuessesPerPris :: Int
noOfGuessesPerPris = 8

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


main :: IO ()
main = do
  putStrLn "sth"
