module LanguageExercises where

import Data.Char (toUpper)
import Data.List (intercalate)


-- case 1

-- capitalizes string (not necessarily world)
capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x:xs) = (toUpper x) : xs


-- case 2

-- safer tail function, acting like its counterpart in Common Lisp
clTail :: [a] -> [a]
clTail [] = []
clTail (_:xs) = xs

-- split string at specific character
strSplit :: Char -> String -> [String]
strSplit _ [] = []
strSplit sep text =
  let predicate = (\x -> x /= sep)
      firstPart = takeWhile predicate text
      rest = clTail $ dropWhile predicate text
  in [firstPart] ++ strSplit sep rest

-- python's lstrip
-- removes white characters from the beginning of the sentence
lstrip :: String -> String
lstrip [] = []
lstrip t@(x:xs) = if elem x " \t\n" then lstrip xs else t

capitalizeParagraph :: String -> String
capitalizeParagraph [] = []
capitalizeParagraph paragraph =
  let sentences = strSplit '.' paragraph
  -- capitalizeWord should work just as good on a sentence
      capitalizedSentences = map (capitalizeWord . lstrip) sentences
  in intercalate ". " capitalizedSentences
