module Task3 where

import Data.Char (toLower)
import Data.List (sort)

toLowerAndSort :: String -> String
toLowerAndSort text = sort $ map toLower text

isAnagram :: String -> String -> Bool
isAnagram word1 word2 =
  let w1 = toLowerAndSort word1
      w2 = toLowerAndSort word2
  in w1 == w2

getAnagramsOfWord :: String -> [String] -> [String]
getAnagramsOfWord aWord dict = filter (\item -> isAnagram aWord item) dict

remAnagramsOfWord :: String -> [String] -> [String]
remAnagramsOfWord aWord dict = filter (\item -> not $ isAnagram aWord item) dict

getMostAnagrams :: [String] -> [String] -> [String]
getMostAnagrams curMost [] = curMost
getMostAnagrams curMost dict =
  let newAnagrams = getAnagramsOfWord (head dict) dict
      newDict = remAnagramsOfWord (head dict) dict
  in if (length newAnagrams) > (length curMost)
     then getMostAnagrams newAnagrams newDict
     else getMostAnagrams curMost newDict
