module AsPatterns where

import Data.Char (toUpper)


-- case 1

-- safer, common lisp's like tail
clTail :: [a] -> [a]
clTail [] = []
clTail (_:xs) = xs

-- returns rest of the sequence after x is found in the list ys
-- eg. 'a' in 'kasia' -> 'asia'
getRestSeqFromX :: (Eq a) => a -> [a] -> [a]
getRestSeqFromX _ [] = []
getRestSeqFromX x t@(y:ys) = if x == y then t else getRestSeqFromX x ys

isSubseqOf :: (Eq a) => [a] -> [a] -> Bool
isSubseqOf [] [] = True
isSubseqOf _ [] = False
isSubseqOf [] _ = True
isSubseqOf (x:xs) ys =
  let xWithRest = getRestSeqFromX x ys
  in if null xWithRest
     then False
     else isSubseqOf xs $ clTail xWithRest


-- case 2
capitalizeWord :: String -> String
capitalizeWord [] = []
capitalizeWord (x:xs) = (toUpper x) : xs

capitalizeWords :: String -> [(String, String)]
capitalizeWords text =
  let lstOfWords = words text
      lstOfCapWords = map capitalizeWord lstOfWords
      in zip lstOfWords lstOfCapWords


-- tests fo case 1
main :: IO()
main = do
  print $ "Case 1, test 1 passed? " ++ show ((isSubseqOf "blah" "blahwoot") == True)
  print $ "Case 1, test 2 passed? " ++ show ((isSubseqOf "blah" "wootblah") == True)
  print $ "Case 1, test 3 passed? " ++ show ((isSubseqOf "blah" "wboloath") == True)
  print $ "Case 1, test 4 passed? " ++ show ((isSubseqOf "blah" "wootbla") == False)
  print $ "Case 1, test 5 passed? " ++ show ((isSubseqOf "blah" "halbwoot") == False)
  print $ "Case 1, test 6 passed? " ++ show ((isSubseqOf "blah" "blawhoot") == True)
