import qualified Data.Char as C

change2Snake :: String -> String
change2Snake []     = []
change2Snake (x:xs)
  | C.isUpper x = '_' : C.toLower x : change2Snake xs
  | otherwise = x : change2Snake xs

-- uncomment appropriate line below and copy-paste the snippet to ghci (REPL):
-- map change2Snake ["helloWorld", "niceToMeetYou", "translateToEnglish"]
