module Caesar (codeMsg, decodeMsg) where

import Data.Char (chr, ord)

-- jesli po przesunieciu liczbowa repr Char-a wyjdzie poza zakres,
-- tj. 97 - 'a' i 122 - 'z',
-- to ta funkcja 'zawija' liczbowa reprezentacje do zakresu
intReprWithinRange :: Int -> Int
intReprWithinRange x
  | x < 97 = 122 - (97 - x - 1)
  | x > 122 = (mod x 122) + 97 - 1
  | otherwise = x

-- codes only a-z, otherwise returns the character
codeLetter :: Int -> Char -> Char
codeLetter _ ' ' = ' '
codeLetter shift letter = if letter `elem` ['a'..'z']
  then chr $ intReprWithinRange $ (+) shift $ ord letter
  else letter

codeMsg :: Int -> String -> String
codeMsg _ [] = []
codeMsg shift msg = map (codeLetter shift) msg

decodeMsg :: Int -> String -> String
decodeMsg _ [] = []
decodeMsg shift msg = map (codeLetter (negate shift)) msg
