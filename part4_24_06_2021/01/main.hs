-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import Morse (engMorseDict)
import Data.Char (toUpper)
import Data.List.Split (splitOn)


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
msgsOrig :: [String]
msgsOrig  = ["Hello there", "General Kenobi", "SOS", "Ala ma kota"];

msgsMorse :: [String]
msgsMorse  = map engSentenceToMorse msgsOrig

msgsEng :: [String]
msgsEng  = map morseSentenceToEng msgsMorse


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
engLetterToMorse :: Char -> String
engLetterToMorse x = snd $ head $
                     filter (\(a, _) -> a == toUpper x) engMorseDict

engSentenceToMorse :: String -> String
engSentenceToMorse [] = ""
engSentenceToMorse (x:[]) = engLetterToMorse x
engSentenceToMorse (x:xs) = engLetterToMorse x ++ " " ++ engSentenceToMorse xs

morseSymbToEng :: String -> Char
morseSymbToEng x = fst $ head $ filter (\(_, b) -> b == x) engMorseDict

morseSentenceToEng :: String -> String
morseSentenceToEng [] = ""
morseSentenceToEng morse = map morseSymbToEng $ splitOn " " morse


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "We got the following enghlish sentences:"
  putStrLn $ unlines msgsOrig
  putStrLn "After translating them to Morse code we got:"
  putStrLn $ unlines msgsMorse
  putStrLn "After rewriting them again to english we got:"
  putStrLn $ unlines msgsEng
  putStrLn "That's it. Goodbye!"
