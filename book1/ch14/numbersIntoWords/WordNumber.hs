module WordNumber (digitToWord, digits, wordNumber) where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord 0 = "zero"
digitToWord 1 = "one"
digitToWord 2 = "two"
digitToWord 3 = "three"
digitToWord 4 = "four"
digitToWord 5 = "five"
digitToWord 6 = "six"
digitToWord 7 = "seven"
digitToWord 8 = "eight"
digitToWord 9 = "nine"
digitToWord _ = "unknown"

strToLstOfStr :: String -> [String]
strToLstOfStr [] = []
strToLstOfStr (x:xs) = [x] : strToLstOfStr xs

digits :: Int -> [Int]
digits = map read . strToLstOfStr . show

wordNumber :: Int -> String
wordNumber = concat . intersperse "-" . map digitToWord . digits
