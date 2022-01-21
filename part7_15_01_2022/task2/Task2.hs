module Task2 where
import Data.List.Split (splitOn)
import Data.List (intercalate)

fileName :: String
fileName = "./text_to_use.txt"

rpad :: String -> Int -> String -> String
rpad _ 0 text = text
rpad pad finalLen text = if (length text) >= finalLen then text
                          else rpad pad finalLen (text ++ pad)

lpad :: String -> Int -> String -> String
lpad _ 0 text = text
lpad pad finalLen text = if (length text) >= finalLen then text
                          else lpad pad finalLen (pad ++ text)

-- if odd number of pads needs to be added (cannot split evenly on both sides)
-- then it adds one more pad on the left
cpad :: String -> Int -> String -> String
cpad pad finalLen text =
  let textLen = length text
      lPadLen = round (fromIntegral (finalLen - textLen) / 2)
      lPadFinalLen = textLen + lPadLen
      lPaddedText = lpad pad lPadFinalLen text
  in rpad pad finalLen lPaddedText

getWords :: String -> String -> [[String]]
getWords sep someTxt = map (splitOn sep) $ lines someTxt

getWordsLens :: [[String]] -> [[Int]]
getWordsLens wrds = map (map length) $ wrds

getNoOfColsInRow :: [[Int]] -> [Int]
getNoOfColsInRow wordsLens = map length wordsLens

getElt :: Int -> Int -> [Int] -> Int
getElt _ defVal [] = defVal
getElt 0 _ lst = head lst
getElt ind defVal lst = getElt (ind - 1) defVal (tail lst)

getElts :: Int -> Int -> [[Int]] -> [Int]
getElts ind defVal lstOfLsts = map (getElt ind defVal) lstOfLsts

getMaximumOfEltsAtInd :: Int -> Int -> [[Int]] -> Int
getMaximumOfEltsAtInd ind defVal lstOfLsts =
  maximum $ getElts ind defVal lstOfLsts

getMaxesAtInds :: [Int] -> [[Int]] -> [Int]
getMaxesAtInds inds lstOfLsts =
  foldr (\ind acc -> (getMaximumOfEltsAtInd ind 0 lstOfLsts) : acc) [] inds

getMaxLenOfEachCol :: String -> String -> [Int]
getMaxLenOfEachCol sep text =
  let wordsLens = getWordsLens $ getWords sep text
      colsInRows = getNoOfColsInRow wordsLens
      noOfCols = maximum colsInRows
      noOfCharsInCols = getMaxesAtInds [0..(noOfCols - 1)] wordsLens
  in noOfCharsInCols

getColString :: (String -> Int -> String -> String) ->
  [Int] -> [String] -> String
getColString padFn colLensList wordsList =
  let colsPadded = zipWith (padFn " ") colLensList wordsList
  in intercalate "" colsPadded

getPaddedText :: String -> (String -> Int -> String -> String)
  -> String -> String
getPaddedText sep padFn text =
  let lstOfLstWords = getWords sep text
      colLens = map (+4) $ getMaxLenOfEachCol sep text
  in intercalate "\n" $ map (getColString padFn colLens) lstOfLstWords

main :: IO ()
main = do
  putStrLn $ "Reading $ delimited text from '" ++ fileName ++ "'"
  textToTransform <- readFile fileName
  putStrLn "\nafter putting the text in columns (r-just) we got:"
  putStrLn "========================================="
  putStrLn $ getPaddedText "$" lpad textToTransform
  putStrLn "========================================="
  putStrLn "\nafter putting the text in columns (l-just) we got:"
  putStrLn "========================================="
  putStrLn $ getPaddedText "$" rpad textToTransform
  putStrLn "========================================="
  putStrLn "\nafter putting the text in columns (c-just) we got:"
  putStrLn "========================================="
  putStrLn $ getPaddedText "$" cpad textToTransform
  putStrLn "========================================="
  putStrLn "\nThat's all. Goodbye."
