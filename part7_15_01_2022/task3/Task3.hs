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
