module Task2 where

import System.Random

type Prisoner = Int
type Card = Int

prisoners :: [Prisoner]
prisoners = [0..9]

noOfGuessesPerPris :: Int
noOfGuessesPerPris = 8

getRndCard :: IO [Card]
getRndCard = do
  gen <- getStdGen
  _ <- newStdGen
  return $ take noOfGuessesPerPris $ randomRs (0, length(prisoners) - 1) gen

-- now use, e.g:
-- fmap (anyCardEqlPrisId (prisoners !! 0)) getRndCard
-- to apply getRndCard to anyCardEqlPrisId
-- but it returns IO Bool
anyCardEqlPrisId :: Int -> [Card] -> Bool
anyCardEqlPrisId _ [] = False
anyCardEqlPrisId prisId (card:cards) = if card == prisId then True
                                       else anyCardEqlPrisId prisId cards

main :: IO ()
main = do
  putStrLn "sth"
