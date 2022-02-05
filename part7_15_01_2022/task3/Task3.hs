module Task3 where

import Data.Char (toLower)
import Data.List (groupBy, sort, sortBy)

fileName :: String
fileName = "./unixdict.txt"

getKey :: String -> String
getKey wrd = sort $ map toLower wrd

getKeyVals :: [String] -> [(String, String)]
getKeyVals wrds = zip (map getKey wrds) wrds

dictSorter :: (String, String) -> (String, String) -> Ordering
dictSorter (k1, _) (k2, _) = compare k1 k2

getKeysValsSorted :: [String] -> [(String, String)]
getKeysValsSorted wrds = sortBy dictSorter $ getKeyVals wrds

dictGrouper :: (String, String) -> (String, String) -> Bool
dictGrouper (k1, _) (k2, _) = k1 == k2

getKeysValsSortedGrouped :: [String] -> [[(String, String)]]
getKeysValsSortedGrouped wrds = groupBy dictGrouper $ getKeysValsSorted wrds

getWordsOfGroupedDicts :: [[(String, String)]] -> [[String]]
getWordsOfGroupedDicts dicts = map (map (\(_, v) -> v)) dicts

getMaxLen :: [[String]] -> Int
getMaxLen anagrams = maximum $ map length anagrams

getMaxAnagrams :: [String] -> [[String]]
getMaxAnagrams wrds =
  let anagrams = getWordsOfGroupedDicts $ getKeysValsSortedGrouped wrds
      maxLen = getMaxLen anagrams
  in filter (\subLst -> length subLst == maxLen) anagrams

-- it takes around 0.243 sec to execute (there is still place for improvement)
main :: IO ()
main = do
  putStrLn $ "Reading list of words from '" ++ fileName ++ "'"
  lstOfWords <- readFile fileName
  putStrLn "Looking for the greatest number of anagrams in the red dictionary"
  putStrLn "PLEASE BE PATIENT THIS MAY TAKE SOME TIME"
  putStrLn "\nResult:"
  mapM_ print $ getMaxAnagrams $ lines lstOfWords
  putStrLn "\nThat's all. Goodbye."
