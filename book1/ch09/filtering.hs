import Data.Char (toLower)

-- case 1
multOf :: Int -> Int -> Int -> [Int]
multOf 0 _ _ = []
multOf someNum rangeStartIncl rangeEndIncl =
  let rngOfVals = [rangeStartIncl..rangeEndIncl]
      predicate = (\x -> mod x someNum == 0)
  in filter predicate rngOfVals


-- case 2
-- noOfMultiplesOf :: Int -> Int -> Int -> Int
noOfMultiplesOf someNum rangeStartIncl rangeEndIncl =
  length $ multOf someNum rangeStartIncl rangeEndIncl
-- not exactly function composition (I used '$' instead of '.')
-- but my functions are more universal (I prefer it that way)


-- case 3
-- functions from theFearfulSymmetry.hs
clTail :: [a] -> [a]
clTail [] = []
clTail (x:xs) = xs

strSplit sep [] = []
strSplit sep text =
  let predicate = (\x -> x /= sep)
      firstPart = takeWhile predicate text
      rest = clTail $ dropWhile predicate text
  in [firstPart] ++ strSplit sep rest

-- list of articles
englArticles :: [String]
englArticles = ["a", "an", "the"]

strToLower :: String -> String
strToLower text = map toLower text

remEnglArticles :: String -> [String]
remEnglArticles text = [x | x <- strSplit ' ' text,
                        notElem (strToLower x) englArticles]
