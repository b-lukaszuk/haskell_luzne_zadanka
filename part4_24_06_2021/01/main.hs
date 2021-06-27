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

declareTransformations :: String -> String
declareTransformations msgOrig =
  let sep = "========"
      intro = "Original message: <<" ++ msgOrig ++ ">>"
      codedMsg = engSentenceToMorse msgOrig
      morseDeclar = "After coding into Morse code:\n" ++ codedMsg
      decodedMsg = morseSentenceToEng codedMsg
      demorseDeclar = "After decoding from Morse code:\n" ++ decodedMsg
  in unlines $ [sep, intro, morseDeclar, demorseDeclar, sep]


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "Simple Morse coder/decoder in action:\n\n"
  putStrLn $ unlines $ map declareTransformations msgsOrig
  putStrLn "That's it. Goodbye!"
