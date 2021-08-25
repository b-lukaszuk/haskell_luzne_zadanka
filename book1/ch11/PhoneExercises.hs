module PhoneExercises where

-- (Char - representation [0-9*#]), possible values/letters after pressing ()
data Button = Button (Char, String)
testBtn :: Button
testBtn = Button ('2', "abc2")

press :: Button -> Int -> Char
press (Button (_, options)) times =
  let adjTimes = mod (times - 1) $ length options
  in options !! adjTimes

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
              zero = Button ('0', " +0")
              hash = Button ('#', ".,#")


convo :: [String]
convo = ["Wanna play 20 questions", "Ya",
         "U 1st haha",
         "Lol ok. Have u ever tasted alcohol",
         "Lol ya", "Wow ur cool haha. Ur turn",
         "Ok. Do u think I am pretty Lol",
         "Lol ya",
         "Just making sure rofl ur turn"]

-- validButtons = "1234567890*#"
type Digit = Char

-- Valid presses: 1 and up
type Presses = Int

reverseTaps :: DaPhone -> Char -> [(Digit, Presses)]
reverseTaps = undefined
-- assuming the default phone definition
-- 'a' -> [('2', 1)]
-- 'A' -> [('*', 1), ('2', 1)]

cellPhonesDead :: DaPhone -> String -> [(Digit, Presses)]
cellPhonesDead = undefined
