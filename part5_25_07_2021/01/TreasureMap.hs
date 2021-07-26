module TreasureMap (treasureMap, treasMapToString, treasMapLoc) where


-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
-- nothing to import here


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
treasureMap :: [[Int]]
treasureMap = [
  [34, 31, 32, 41, 25],
  [14, 42, 43, 14, 31],
  [54, 45, 52, 42, 23],
  [33, 15, 51, 31, 35],
  [21, 52, 33, 13, 23]]

cellHorizBound :: String
cellHorizBound = "----"


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
padDigit :: Int -> String
padDigit num = " " ++ (show num) ++ " "

myConcatWith :: String -> [String] -> String
myConcatWith symb [] = symb
myConcatWith symb (x:xs) = symb ++ x ++ myConcatWith symb xs

tmRowToString :: [Int] -> String
tmRowToString [] = ""
tmRowToString xs = myConcatWith "|" $ map padDigit xs

getHorizSep :: [Int] -> String
getHorizSep xs = myConcatWith "+" $ replicate (length xs) cellHorizBound

-- tm - treasure map
tmToString' :: [[Int]] -> [String]
tmToString' [] = []
tmToString' (x:xs) = tmRowToString x : tmToString' xs

treasMapToString :: [[Int]] -> String
treasMapToString [] = ""
treasMapToString xs@(x:_) =
  let sep = "\n" ++ (getHorizSep x) ++ "\n"
      tresMap = tmToString' xs
  in myConcatWith sep tresMap

-- 1 indexed not 0 indexed
treasMapLoc :: [[Int]] -> [Int] -> Int
treasMapLoc _ [] = 0
treasMapLoc [] _ = 0
treasMapLoc trMap loc = (trMap !! ((loc !! 0) - 1)) !! ((loc !! 1) -1)
