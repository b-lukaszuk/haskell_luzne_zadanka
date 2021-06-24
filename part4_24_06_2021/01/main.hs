-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
-- import qualified Morse.engMorseDict as morseDict
import Morse
import Data.Char (toUpper)


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
messages :: [String]
messages  = ["Hello there", "General Kenobi", "SOS", "A"];


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
letterToMorse :: String -> String
letterToMorse [] = ""
letterToMorse x = head [b |
                        (a, b) <- filter (\(a, b) -> a == [toUpper $ head x])
                        engMorseDict]

-- strToMorse :: String -> String
-- strToMorse [] = ""
-- strToMorse (x:xs) =


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "That's it. Goodbye!"
