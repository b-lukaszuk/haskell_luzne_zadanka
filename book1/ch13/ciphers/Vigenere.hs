module Vigenere (codeMsg, decodeMsg) where

import Data.Char (chr, ord, toLower)

strToLower :: String -> String
strToLower = map toLower

-- repeats str1 to the length of str2
-- returns String of the length of the smaller of the two strings
repeatStr :: String -> String -> String
repeatStr _ [] = []
repeatStr [] _ = []
repeatStr (x:xs) (y:ys) = if y == ' '
                          then ' ' : repeatStr (x:xs) ys
                          else x : repeatStr xs ys

-- returns -1 if the element was not found on the list
eltPosInList :: (Eq a) => a -> [a] -> Int
eltPosInList y xs = eltPosInList' y xs 0

-- first invocation: eltPosInList' y (x:xs) 0
eltPosInList' :: (Eq a) => a -> [a] -> Int -> Int
eltPosInList' _ [] _ = -1
eltPosInList' y (x:xs) counter =
  if y == x
  then counter
  else eltPosInList' y xs $ counter + 1

--------------------------------------------------------------------------------
-- below: copy of my solution for ciphers in Chapter 09 (and small modification)
--------------------------------------------------------------------------------

-- if after the shift numeric representation of Char will go out of the range
-- e.g.. 97 - 'a' and 122 - 'z',
-- then this function will 'roll' the numeric representation bac to the range
intReprWithinRange :: Int -> Int
intReprWithinRange x
  | x < 97 = 122 - (97 - x - 1)
  | x > 122 = (mod x 122) + 97 - 1
  | otherwise = x

codeLetter :: Int -> Char -> Char
codeLetter _ ' ' = ' '
codeLetter shift letter = chr $ intReprWithinRange $
                          (+) shift $ ord $ toLower letter

decodeLetter :: Int -> Char -> Char
decodeLetter shift letter = codeLetter (negate shift) letter

getPairsLetterShift :: String -> String -> [(Char, Int)]
getPairsLetterShift codeKey msg =
  let codeKeyModif = repeatStr (cycle $ strToLower codeKey) msg
      shifts = map (\x -> eltPosInList x ['a'..'z']) codeKeyModif
  in zip msg shifts

codeMsg :: String -> String -> String
codeMsg _ [] = []
codeMsg codeKey msg =
  let pairs = getPairsLetterShift codeKey msg
      translMsg = map (\(letter, shift) -> codeLetter shift letter) pairs
  in translMsg

decodeMsg :: String -> String -> String
decodeMsg _ [] = []
decodeMsg codeKey msg =
  let pairs = getPairsLetterShift codeKey msg
      translMsg = map (\(letter, shift) -> decodeLetter shift letter) pairs
  in translMsg
