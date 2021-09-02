module StringProcessing where

import Data.List (intercalate)

-- THE FUNCTIONS BELOW DEAL ONLY WITH SIMPLE STRINGS
-- (LOWERCASE, NO COMMAS, PERIODS, ETC.)


-- case 1
-- not sure do I need this notThe
-- I think I will just comment it out for now
-- notThe :: String -> Maybe String
-- notThe = undefined

theToA :: String -> String
theToA aWord = if aWord == "the" then "a" else aWord

-- it will be shorter with map and intercalate
replaceThe :: String -> String
replaceThe sentence =
  let lstOfWords = words sentence
      lstAForThe = map theToA lstOfWords
  in intercalate " " lstAForThe

-- recursive version
-- replaceThe :: String -> String
-- replaceThe sentence =
--   let lstOfWords = words sentence
--   in replaceThe' lstOfWords

-- replaceThe' :: [String] -> String
-- replaceThe' [] = []
-- replaceThe' (x:xs) = if x == "the"
--   then "a " ++ replaceThe' xs
--   else x ++ " " ++ replaceThe' xs


-- case 2
startsWithVowel :: String -> Bool
startsWithVowel aWord = elem (head aWord) "aeiou"

theAndVowel :: (String, String) -> Bool
theAndVowel (word1, word2) = word1 == "the" && startsWithVowel word2

-- I know how to write recursive version (just like I did in case 1 above)
-- so I will just write without recursion (it's more plesant/concise this way)
countTheBeforeVowel :: String -> Int
countTheBeforeVowel sentence =
  let lstOfWords = words sentence
      lstOfPairs = zip lstOfWords $ tail lstOfWords
      lstTheBeforeVowels = filter theAndVowel lstOfPairs
  in length lstTheBeforeVowels


-- case 3
-- no recursion
countVowels :: String -> Int
countVowels aWord = length $ filter (\x -> elem x "aeiou") aWord

-- recursion, but not tail recursion
-- countVowels' :: String -> Int
-- countVowels' [] = 0
-- countVowels' (x:xs) =
--   if elem x "aeiou"
--   then 1 + countVowels' xs
--   else countVowels' xs
