module Task2 where
import Data.List.Split (splitOn)

x = "Given$a$text$file$of$many$lines,$where$fields$within$a$line$ \nare$delineated$by$a$single$'dollar'$character,$write$a$program \nthat$aligns$each$column$of$fields$by$ensuring$that$words$in$each$ \ncolumn$are$separated$by$at$least$one$space. \nFurther,$allow$for$each$word$in$a$column$to$be$either$left$ \njustified,$right$justified,$or$center$justified$within$its$column."

lpad :: Int -> String -> String -> String
lpad 0 text _ = text
lpad finalLen text lPad = if (length text) > finalLen then text
                          else lpad (finalLen - 1) (lPad ++ text) lPad

getWords :: String -> [[String]]
getWords someTxt = map (splitOn "$") $ lines someTxt

getWordsLens :: [[String]] -> [[Int]]
getWordsLens wrds = map (map length) $ wrds

getNoOfColsInRow :: [[Int]] -> [Int]
getNoOfColsInRow wordsLens = map length wordsLens

getElt :: Int -> Int -> [Int] -> Int
getElt ind defVal [] = defVal
getElt 0 _ lst = head lst
getElt ind defVal lst = getElt (ind - 1) defVal (tail lst)

getElts :: Int -> Int -> [[Int]] -> [Int]
getElts ind defVal lstOfLsts = map (getElt ind defVal) lstOfLsts

getMaxLenOfEachCol text =
  let wordsLens = getWordsLens $ getWords text
      colsInRows = getNoOfColsInRow wordsLens
      noOfCols = maximum colsInRows
      noOfCharsInCols = foldr (\ind acc ->
                                 (maximum (getElts ind 0 wordsLens)) : acc)
                        [] [0..(noOfCols - 1)]
  in noOfCharsInCols
