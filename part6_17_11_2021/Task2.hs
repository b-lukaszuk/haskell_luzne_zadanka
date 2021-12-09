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

anyCardEqlPrisId :: Int -> [Card] -> Bool
anyCardEqlPrisId _ [] = False
anyCardEqlPrisId prisId (card:cards) = if card == prisId then True
                                       else anyCardEqlPrisId prisId cards

prisonersFoundCards :: [Prisoner] -> [IO Bool]
prisonersFoundCards [] = []
prisonersFoundCards (pris:ps) = fmap (anyCardEqlPrisId pris) getRndCards :
  prisonersFoundCards ps

allPrisFoundCards :: [IO Bool] -> IO Bool
allPrisFoundCards [] = return True
allPrisFoundCards (result:results) = do
  res <- result
  if not res then return False else allPrisFoundCards results


main :: IO ()
main = do
  putStrLn "sth"
