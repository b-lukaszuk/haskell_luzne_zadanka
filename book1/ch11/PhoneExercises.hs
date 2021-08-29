module PhoneExercises where

import Data.Char (toLower)


-- case 1

-- validButtons = "1234567890*#"
type Digit = Char

-- (Char - representation [0-9*#]), possible values/letters after pressing ()
data Button = Button (Digit, String) deriving (Show, Eq)
testBtn :: Button
testBtn = Button ('2', "abc2")

-- Valid presses: 1 and up
type Presses = Int

-- returns -2 if the element was not found on the list
eltPosInList :: (Eq a) => a -> [a] -> Int
eltPosInList y xs = eltPosInList' y xs 0

-- first invocation: eltPosInList' y (x:xs) 0
eltPosInList' :: (Eq a) => a -> [a] -> Int -> Int
eltPosInList' _ [] _ = -2
eltPosInList' y (x:xs) counter =
  if y == x
  then counter
  else eltPosInList' y xs $ counter + 1

-- returns -1 if wrong character is requested
reprToPresses :: Button -> Char -> Presses
reprToPresses (Button (_, options)) searchedChar =
  (+1) $ eltPosInList searchedChar options

getDigit :: Button -> Digit
getDigit (Button (digit, _)) = digit

data DaPhone = DaPhone [Button]

phoneDial :: DaPhone
phoneDial = DaPhone [one, two, three, four, five, six, seven, eight,
                     nine, asterix, zero, hash]
            where
              one = Button ('1', "1")
              two = Button ('2', "abc2")
              three = Button ('3', "def3")
              four = Button ('4', "ghi4")
              five = Button ('5', "jkl5")
              six = Button ('6', "mno6")
              seven = Button ('7', "pqrs7")
              eight = Button ('8', "tuv8")
              nine = Button ('9', "wxyz")
              asterix = Button ('*', "*")
              zero = Button ('0', "+ 0")
              hash = Button ('#', ".,#")


-- case 2

convo :: [String]
convo = ["Wanna play 20 questions",
         "Ya",
         "U 1st haha",
         "Lol ok. Have u ever tasted alcohol",
         "Lol ya",
         "Wow ur cool haha. Ur turn",
         "Ok. Do u think I am pretty Lol",
         "Lol ya",
         "Just making sure rofl ur turn"]

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps (DaPhone keys) searchedChar =
  let lookupChar = toLower searchedChar
      foundKeys = filter (\(Button (_, opts)) -> elem lookupChar opts) keys
      key = foundKeys !! 0
      result = (getDigit key, reprToPresses key lookupChar)
  in if elem searchedChar ['A'..'Z'] then [('*', 1), result] else [result]

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead phone phrase =
  let taps = map (\x -> reverseTaps phone x) phrase
  in concat taps

convoTaps :: [[(Digit, Presses)]]
convoTaps = map (\msg -> cellPhonesDead phoneDial msg) convo


-- case 3

fingerTaps :: [(Digit, Presses)] -> Presses
fingerTaps xs = length xs

digitsForEachMsg :: [Presses]
digitsForEachMsg = map fingerTaps convoTaps


-- case 4

strToLower :: String -> String
strToLower [] = []
strToLower (x:xs) = toLower x : strToLower xs

remFromList :: Eq a => a -> [a] -> [a]
remFromList toRem aList = filter (\a -> a /= toRem) aList

countLstElts :: Eq a => [a] -> [(a, Int)]
countLstElts xs = countLstElts' xs []

countLstElts' :: Eq a => [a] -> [(a, Int)] -> [(a, Int)]
countLstElts' [] acc = acc
countLstElts' xs acc =
  let first = head xs
      strWithoutX = remFromList first xs
      noOfX = (length xs) - length strWithoutX
  in countLstElts' strWithoutX $ (first, noOfX) : acc

-- in python it would be like: {'a': 5, 'b': 3}, here [('a', 5), ('b', 3)]
-- if tie, one of the winners is returned
maxOfDict :: (a, Int) -> (a, Int) -> (a, Int)
maxOfDict (c1, i1) (c2, i2) = if i1 > i2 then (c1, i1) else (c2, i2)

maximumOfDict :: [(a, Int)] -> (a, Int)
maximumOfDict dict = foldr maxOfDict (head dict) (tail dict)

-- modified: returns (Char, Int) instead of Char (for me it's better this way)
mostPopularLetter :: String -> (Char, Int)
mostPopularLetter [] = ('?', 0)
mostPopularLetter text =
  let transformedTxt = filter (\x -> elem x ['a'..'z']) $ strToLower text
      charCounts = countLstElts transformedTxt
  in maximumOfDict charCounts

mostPopLetters :: [String] -> [(Char, Int)]
mostPopLetters paragraphs = map mostPopularLetter paragraphs

mostPopLettersConvo :: [(Char, Int)]
mostPopLettersConvo = mostPopLetters convo


-- case 5

-- modified: returns (Char, Int) instead of Char (for me it's better this way)
coolestLtr :: [String] -> (Char, Int)
coolestLtr texts =
  let txtConcat = foldr (\cur acc -> cur ++ acc) [] texts
      txtLower = filter (\x -> elem x ['a'..'z']) $ strToLower txtConcat
      ltrDict = countLstElts txtLower
  in maximumOfDict ltrDict

coolestLtrConvo :: (Char, Int)
coolestLtrConvo = coolestLtr convo

mostPopWord :: String -> (String, Int)
mostPopWord text =
  let modifTxt = filter (\x -> elem x $ ['a'..'z'] ++ " ") $ strToLower text
      lstOfWords = words modifTxt
      dictOfCounts = countLstElts lstOfWords
  in maximumOfDict dictOfCounts

coolestWord :: [String] -> (String, Int)
coolestWord paragraphs =
  let singleString = foldr (\cur acc -> cur ++ " " ++ acc) [] paragraphs
      textLower = strToLower singleString
  in mostPopWord textLower

coolestWordConvo :: (String, Int)
coolestWordConvo = coolestWord convo
