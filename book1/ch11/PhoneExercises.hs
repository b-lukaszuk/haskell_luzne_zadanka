module PhoneExercises where

import Data.Char (toLower)

-- validButtons = "1234567890*#"
type Digit = Char

-- (Char - representation [0-9*#]), possible values/letters after pressing ()
data Button = Button (Digit, String) deriving (Show, Eq)
testBtn :: Button
testBtn = Button ('2', "abc2")

-- Valid presses: 1 and up
type Presses = Int

press :: Button -> Presses -> Char
press (Button (_, options)) times =
  let adjTimes = mod (times - 1) $ length options
  in options !! adjTimes

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
              asterix = Button ('*', "")
              zero = Button ('0', "+ 0")
              hash = Button ('#', ".,#")


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
