module Main where

import Control.Monad (forever)
import Data.Char (toLower)
import Data.Maybe (isJust)
import Data.List (intersperse)
import System.Exit (exitSuccess)
import System.Random (randomRIO)

type WordList = [String]

allWords :: IO WordList
allWords = do
  dict <- readFile "data/dict.txt"
  return (lines dict)

minWordLength :: Int
minWordLength = 5

maxWordLength :: Int
maxWordLength = 9

isBetw :: Int -> Int -> Int -> Bool
isBetw someNum minIncl maxIncl = someNum >= minIncl && someNum <= maxIncl

gameWords :: IO WordList
gameWords = do
  aw <- allWords
  return (filter (\aWrd -> isBetw (length aWrd) minWordLength maxWordLength) aw)

randomWord :: WordList -> IO String
randomWord wl = do
  randomIndex <- randomRIO (0, (length wl) - 1)
  return $ wl !! randomIndex

randomWord' :: IO String
randomWord' = gameWords >>= randomWord

-- type synonyms (my modif)
type WordToGuess = String
type CharsFilledSoFar = [Maybe Char]
type LettersGuessedSoFar = [Char]

-- helper fn (my modif)
-- ok, later there is a function to write:
-- renderPUzzleChar :: Maybe Char -> Char
-- so I guess I did that earlier
getCharRepr :: Maybe Char -> Char
getCharRepr Nothing = '_'
getCharRepr (Just letter) = letter

-- helper fn (my modif)
getCharsRepr :: [Maybe Char] -> String
getCharsRepr text  = map getCharRepr text

data Puzzle = Puzzle WordToGuess CharsFilledSoFar LettersGuessedSoFar

instance Show Puzzle where
  show (Puzzle _ discovered guessed) =
    (intersperse ' ' $ getCharsRepr discovered) ++
    " Guessed so far: " ++ guessed

test :: Puzzle
test = (Puzzle "abc" [Just 'a', Nothing, Just 'b'] "kasic")

freshPuzzle :: String -> Puzzle
freshPuzzle aWord = Puzzle aWord (take wordLen $ repeat Nothing) []
  where wordLen = length aWord

charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle wordToGuess _ _) guess = elem guess wordToGuess

alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ _ prevGuesses) guess = elem guess prevGuesses

main :: IO ()
main = do
  putStrLn "hello world"
