import Data.Char (digitToInt, isDigit)

lstOfIntsToInt :: [Int] -> Int
lstOfIntsToInt [] = 0
lstOfIntsToInt (x:xs) = x * (10^(length xs)) + lstOfIntsToInt xs

strOfDigitsToInt :: String -> Int
strOfDigitsToInt strOfDigits = lstOfIntsToInt $ map digitToInt strOfDigits

foldingFn :: Char -> String -> String
foldingFn curVal acc = if isDigit curVal
  then curVal : acc
  else acc

asInt :: String -> Int
asInt someString =
  let result = strOfDigitsToInt $ foldr foldingFn "" someString
  in if head someString == '-' then negate result else result
