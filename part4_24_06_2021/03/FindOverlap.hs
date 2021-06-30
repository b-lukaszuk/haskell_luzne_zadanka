module FindOverlap (findOverlapingString) where


-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import Data.List (find)
import ListOfSubstrings (getSubstrOfLen)


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
findWordInList :: String -> [String] -> Maybe String
findWordInList word lstOfWords = find (\wrd -> wrd == word) lstOfWords

-- finds if any word from words1 is in words2
findFirstWords1inWords2 :: [String] -> [String] -> Maybe String
findFirstWords1inWords2 _ [] = Nothing
findFirstWords1inWords2 [] _ = Nothing
findFirstWords1inWords2 (word1:words1) words2 =
  let result = findWordInList word1 words2
  in case result of
    Nothing -> findFirstWords1inWords2 words1 words2
    _ -> result

findOverlapingStringOfLen :: Int -> String -> String -> Maybe String
findOverlapingStringOfLen len word1 word2 =
  let words1 = getSubstrOfLen len word1
      words2 = getSubstrOfLen len word2
  in findFirstWords1inWords2 words1 words2

-- finds overlaping string starting from some length and going down by 1
findOverlapingString' :: Int -> String -> String -> Maybe String
findOverlapingString' 0 _ _ = Nothing
findOverlapingString' overlapLen word1 word2 =
  let result = findOverlapingStringOfLen overlapLen word1 word2
  in case result of
    Nothing -> findOverlapingString' (overlapLen - 1) word1 word2
    _ -> result

findOverlapingString :: String -> String -> Maybe String
findOverlapingString [] _ = Nothing
findOverlapingString _ [] = Nothing
findOverlapingString word1 word2 =
  let startingLen = min (length word1) (length word2)
  in findOverlapingString' startingLen word1 word2
