-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import Data.Char (toLower, toUpper)
import Data.List.Split (splitOn)


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
phrasesEng :: [String]
phrasesEng = ["The quick brown fox", "ala ma kota"]

pigLatenizedEng :: [String]
pigLatenizedEng = map latenizeSentence phrasesEng

deLatenizedEng :: [String]
deLatenizedEng = map deLatenizeSentence pigLatenizedEng


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
upCaseFirstLetRemLastLet :: String -> String
upCaseFirstLetRemLastLet [] = ""
upCaseFirstLetRemLastLet (x:xs) = (toUpper x) : (init xs)

listOfStrToSentence :: [String] -> String
listOfStrToSentence [] = ""
listOfStrToSentence xs = concat $ zipWith (\x y -> x ++ y) xs $ repeat " "

latenizeWord :: String -> String
latenizeWord [] = ""
latenizeWord (x:xs) = xs ++ [toLower x] ++ "ay"

latenizeSentence :: String -> String
latenizeSentence [] = ""
latenizeSentence xs = upCaseFirstLetRemLastLet $
                       listOfStrToSentence $ map latenizeWord $ splitOn " " xs

deLatenizeWord :: String -> String
deLatenizeWord [] = ""
deLatenizeWord (x:xs) =
  let noAy = (toLower x) : take (length xs - 2) xs
      delatenized = last noAy : init noAy
  in delatenized

deLatenizeSentence :: String -> String
deLatenizeSentence [] = ""
deLatenizeSentence xs = upCaseFirstLetRemLastLet $ listOfStrToSentence $
                        map deLatenizeWord $ splitOn " " xs


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "We got the following sentences:"
  putStrLn $ unlines phrasesEng
  putStrLn "We PigLatenize them to:"
  putStrLn $ unlines pigLatenizedEng
  putStrLn "We dePigLatenize them to:"
  putStrLn $ unlines deLatenizedEng
  putStrLn "That's it. Goodbye!"
