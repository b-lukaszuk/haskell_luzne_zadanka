module Task3 where

import Text.Printf (printf)
import Data.List (intercalate)

bottOfBeer :: [Int]
bottOfBeer = [99,98..1]

sayHowManyBott :: Int -> String
sayHowManyBott n = printf "%d bottle%s of beer" n $ if n == 1 then "" else "s"

wall :: String
wall = " on the wall"

oneDown :: String
oneDown = "Take one down, pass it around"

getVerse :: Int -> String
getVerse nOfBott =
  let bottOnly = sayHowManyBott nOfBott
      bottOnWall = bottOnly ++ wall
      bottRemained = (sayHowManyBott (nOfBott - 1)) ++ wall
  in intercalate "\n" [bottOnWall, bottOnly, oneDown, bottRemained]

getSong :: [Int] -> String
getSong lstOfBottles = intercalate "\n\n" $ map getVerse lstOfBottles

main :: IO ()
main = do
  putStrLn $ getSong bottOfBeer
