module Main where

import Control.Monad (forever)
import Data.Char (toLower)
import Data.Maybe (isJust)
import Data.List (intersperse)
import System.Exit (exitSuccess)
import System.Random (randomRIO)
import Data.List (sort)

type WordList = [String]

allWords :: IO WordList
allWords = do
  dict <- readFile "../data/dict.txt"
  return (lines dict)

minWordLength :: Int
minWordLength = 5

maxWordLength :: Int
maxWordLength = 9

maxWrongGuesses :: Int
maxWrongGuesses = 9

isBetw :: Int -> Int -> Int -> Bool
isBetw someNum minIncl maxIncl = someNum >= minIncl && someNum <= maxIncl

rmdups :: (Eq a) => [a] -> [a]
rmdups xs = foldr (\cur acc -> if elem cur acc then acc else cur : acc) [] xs

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
type WrongGuessesSoFar = [Char]

maybeCharsToChars :: [Maybe Char] -> [Char]
maybeCharsToChars [] = []
maybeCharsToChars (x:xs) = case x of
  (Just sth) -> sth : maybeCharsToChars xs
  Nothing -> maybeCharsToChars xs

-- helper fn (my modif)
-- ok, later there is a function to write:
-- renderPuzzleChar :: Maybe Char -> Char
-- so I guess I did that earlier
getCharRepr :: Maybe Char -> Char
getCharRepr Nothing = '_'
getCharRepr (Just letter) = letter

-- helper fn (my modif)
getCharsRepr :: [Maybe Char] -> String
getCharsRepr text  = map getCharRepr text

data Puzzle = Puzzle WordToGuess CharsFilledSoFar WrongGuessesSoFar

instance Show Puzzle where
  show (Puzzle _ discovered wrongGuesses) =
    let allGuessed = (maybeCharsToChars discovered) ++ wrongGuesses
    in (intersperse ' ' $ getCharsRepr discovered) ++
       " Guessed so far: " ++ (sort $ rmdups allGuessed)

freshPuzzle :: String -> Puzzle
freshPuzzle aWord = Puzzle aWord (take wordLen $ repeat Nothing) []
  where wordLen = length aWord

charInWord :: Puzzle -> Char -> Bool
charInWord (Puzzle wordToGuess _ _) guess = elem guess wordToGuess

alreadyGuessed :: Puzzle -> Char -> Bool
alreadyGuessed (Puzzle _ uncovered wrongGuesses) guess =
  let allGuesses = (maybeCharsToChars uncovered) ++ wrongGuesses
  in elem guess allGuesses

-- I split fillInCharacter into three separate functions
-- 2 helpers (zipper and revealChar) and 1 main (fillInCharacter)
zipper :: Char -> Char -> Maybe Char -> Maybe Char
zipper curGuess wordChar charFilledSoFar =
  if wordChar == curGuess
  then Just wordChar
  else charFilledSoFar

revealChar :: Char -> WordToGuess -> CharsFilledSoFar -> CharsFilledSoFar
revealChar aChar aWord uncovChars = zipWith (zipper aChar) aWord uncovChars

fillInCharacter :: Puzzle -> Char -> Puzzle
fillInCharacter (Puzzle word filledInSoFar wg) c =
  Puzzle word newFilledInSoFar wg
  where newFilledInSoFar = revealChar c word filledInSoFar

addCharToWrongGuesses :: Puzzle -> Char -> Puzzle
addCharToWrongGuesses (Puzzle word filledInSoFar prevWrongGuesses) c =
  Puzzle word filledInSoFar (c : prevWrongGuesses)

handleGuess :: Puzzle -> Char -> IO Puzzle
handleGuess puzzle guess = do
  putStrLn $ "Your guess was: " ++ [guess]
  case (charInWord puzzle guess, alreadyGuessed puzzle guess) of
    (_, True) -> do
      putStrLn "You already guessed that character, pick something else!"
      return puzzle
    (True, _) -> do
      putStrLn "This character was in the word, filling in the word accordingly."
      return (fillInCharacter puzzle guess)
    (False, _) -> do
      putStrLn "This character wasn't in the word, try again."
      return (addCharToWrongGuesses puzzle guess)

gameOver :: Puzzle -> IO ()
gameOver (Puzzle wordToGuess _ wrongGuesses) =
  if (length wrongGuesses) > maxWrongGuesses then
    do putStrLn "You lose!"
       putStrLn $ "The word was: " ++ wordToGuess
       exitSuccess
  else return ()

gameWin :: Puzzle -> IO ()
gameWin (Puzzle wordToGuess filledInSoFar _) =
  if all isJust filledInSoFar then
    do putStrLn "You win!"
       putStrLn $ "The word was: " ++ wordToGuess
       exitSuccess
  else return ()

runGame :: Puzzle -> IO ()
runGame puzzle = forever $ do
  gameWin puzzle
  gameOver puzzle
  putStrLn $ "Current puzzle is: " ++ show puzzle
  putStr "Guess a letter: "
  guess <- getLine
  case guess of
    [c] -> handleGuess puzzle c >>= runGame
    _ -> putStrLn "Your guess must be a single character"

main :: IO ()
main = do
  word <- randomWord'
  let puzzle = freshPuzzle $ fmap toLower word
  runGame puzzle
