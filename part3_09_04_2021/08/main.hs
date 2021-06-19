-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import Data.Char (isNumber)


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
digitsAsStrings :: [String]
digitsAsStrings = ["2342", "A243b"]


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
getNums :: String -> String
getNums str = filter isNumber str

declareTestingForStrings :: String -> String
declareTestingForStrings str = let numsFound = getNums str
  in "Testing " ++ str ++ " for digits. Result: " ++
     if (numsFound == "") then "none found" else numsFound


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn $ unlines $ map declareTestingForStrings digitsAsStrings
  putStrLn "That's it. Goodbye!"
