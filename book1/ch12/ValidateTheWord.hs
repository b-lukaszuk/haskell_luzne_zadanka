module ValidateTheWord where

newtype Word' = Word' String deriving (Eq, Show)

vowels :: String
vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord [] = Nothing
mkWord aWord =
  let noOfVowels = length $ filter (\x -> elem x vowels) aWord
      noOfConsonants = length $ filter (\x -> notElem x vowels) aWord
  in if noOfVowels > noOfConsonants
     then Nothing
     else Just $ Word' aWord
