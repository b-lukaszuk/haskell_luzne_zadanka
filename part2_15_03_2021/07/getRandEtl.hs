-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import System.Random

-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums ::  [Int]
nums = [1, 6, 23, 8, 4, 8, 3, 7]

-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- randomowosc omowiona jest dopiero w rozdziale 9
-- http://learnyouahaskell.com/chapters
-- doczytano 05-04-2021
main :: IO()
main = do
  gen <- getStdGen -- rands generator
  -- randomR chooses from a double closed interval, so -1
  let (index, _) = randomR (1::Int, length nums - 1) gen
      randomElt = nums !! index
  putStr $ "Random elt of a list: " ++ show nums ++ " is: "
  putStrLn $ show randomElt
