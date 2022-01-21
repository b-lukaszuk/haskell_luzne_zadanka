module Task2 where
import Data.List.Split (splitOn)
import Data.List (intercalate)

fileName :: String
fileName = "./text_to_use.txt"

rpad :: String -> Int -> String -> String
rpad _ 0 text = text
rpad rPad finalLen text = if (length text) >= finalLen then text
                          else rpad rPad finalLen (text ++ rPad)

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

getColString :: [Int] -> [String] -> String
getColString colLensList wordsList =
  let colsPadded = zipWith (rpad " ") colLensList wordsList
  in intercalate "" colsPadded

getPaddedText :: String -> String -> String
getPaddedText sep text =
  let lstOfLstWords = getWords sep text
      colLens = map (+3) $ getMaxLenOfEachCol sep text
  in intercalate "\n" $ map (getColString colLens) lstOfLstWords

main :: IO ()
main = do
  putStrLn $ "Reading $ delimited text from '" ++ fileName ++ "'"
  textToTransform <- readFile fileName
  putStrLn "after putting the text in columns we got:"
  putStrLn "========================================="
  putStrLn $ getPaddedText "$" textToTransform
  putStrLn "========================================="
  putStrLn "That's all. Goodbye."
