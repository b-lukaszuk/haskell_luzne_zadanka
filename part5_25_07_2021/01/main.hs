-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import TreasureMap (treasureMap, treasMapToString, treasMapLoc)


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
tm :: [[Int]]
tm = treasureMap


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
declareCheck :: [[Int]] -> [Int] -> String
declareCheck [] _ = ""
declareCheck trMap loc =
  let checking = "Checking field: " ++ show loc
      found = " -> Found: " ++ (show $ treasMapLoc trMap loc)
  in checking ++ found

-- two-digit int to [one-digit int, one-digit int]
intToLoc :: Int -> [Int]
intToLoc num =
  let tuplOfStr = splitAt 1 $ show num
      loc = [read $ fst tuplOfStr :: Int, read $ snd tuplOfStr :: Int]
  in loc

-- returns path to treasure in reverse
findTreasure' :: [[Int]] -> [Int] -> [String] -> [String]
findTreasure' trMap loc path =
  let nextLoc = intToLoc $ treasMapLoc trMap loc
  in if nextLoc == loc then declareCheck trMap loc : path
     else findTreasure' trMap nextLoc $ declareCheck trMap loc : path

findTreasure :: [[Int]] -> String
findTreasure trMap =
  let info = "Treasure found!" : findTreasure' trMap [1,1] []
  in unlines $ reverse info


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "Hello. Let's search for a treasure.\n"
  putStrLn "Behold the treasureMap."
  putStrLn $ treasMapToString treasureMap
  putStrLn $ "We will look for a treasure, " ++
    "i.e a place where a field's id is equal to its content"
  putStrLn "Let's begin.\n"
  putStrLn $ findTreasure tm
  putStrLn "That's it. Goodbye!"
