-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import Data.Char (toLower)
import Data.List (find)
import ListOfSubstrings (getAllSubstrings)


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
wordsToTest :: [String]
wordsToTest = ["karakis", "baerren", "kajak", "salami", "sedes", "axy", ""]


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
isPalindrome :: String -> Bool
isPalindrome xs = let lowerCaseString = map toLower xs
                      in lowerCaseString == reverse lowerCaseString

getFirstLongestPalidrome :: String -> String
getFirstLongestPalidrome xs =
  let palindrome = find isPalindrome $ getAllSubstrings xs
  in case palindrome of
    Nothing -> "None found"
    Just value -> value

declarePalindrome :: String -> String
declarePalindrome xs =
  let sep = "==="
      intro = "Searching for the first longest palindrome in: <<" ++ xs ++ ">>"
      result = getFirstLongestPalidrome xs
  in unlines $ [sep, intro, result, sep]


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "Starting palidrome checker\n\n"
  putStrLn $ unlines $ map declarePalindrome wordsToTest
  putStrLn "That's it. Goodbye!"
