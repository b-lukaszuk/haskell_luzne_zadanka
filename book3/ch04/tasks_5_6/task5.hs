import Data.Char (digitToInt, isDigit)

lstOfIntsToInt :: [Int] -> Int
lstOfIntsToInt [] = 0
lstOfIntsToInt (x:xs) = x * (10^(length xs)) + lstOfIntsToInt xs

strOfDigitsToInt :: String -> Int
strOfDigitsToInt strOfDigits = lstOfIntsToInt $ map digitToInt strOfDigits

foldingFn :: Char -> String -> String
foldingFn curVal acc = if isDigit curVal
  then curVal : acc
  else error $ curVal : " is not a digit"

asInt :: String -> Int
asInt someString =
  let shouldNegate = head someString == '-'
      strToProcess = if shouldNegate then tail someString else someString
      result = strOfDigitsToInt $ foldr foldingFn "" strToProcess
  in if shouldNegate then negate result else result
