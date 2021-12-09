module Task2 where

import System.Random

type Prisoner = Int

prisoners :: [Prisoner]
prisoners = [0..9]

noOfGuessesPerPris :: Int
noOfGuessesPerPris = 8

getRndGuesses :: IO [Int]
getRndGuesses = do
  gen <- getStdGen
  _ <- newStdGen
  return $ take noOfGuessesPerPris $ randomRs (0, length(prisoners) - 1) gen

-- now use, e.g:
-- fmap (anyGuessEqlPrisId (prisoners !! 0)) getRndGuesses
-- to apply getRndGuesses to anyGuessEqlPrisId
-- but it returns IO Bool
anyGuessEqlPrisId :: Int -> [Int] -> Bool
anyGuessEqlPrisId _ [] = False
anyGuessEqlPrisId prisId (guess:guesses) = if guess == prisId then True
                                  else anyGuessEqlPrisId prisId guesses

main :: IO ()
main = do
  putStrLn "sth"
