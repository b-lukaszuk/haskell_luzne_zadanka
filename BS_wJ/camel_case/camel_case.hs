import qualified Data.Char as C

change2Snake :: String -> String
change2Snake []     = []
change2Snake (x:xs)
  | C.isUpper x = '_' : C.toLower x : change2Snake xs
  | otherwise = x : change2Snake xs

-- uncomment appropriate line below and copy-paste the snippet to ghci (REPL):
-- map change2Snake ["helloWorld", "niceToMeetYou", "translateToEnglish"]


change2Camel' :: String -> Bool -> String
change2Camel' [] _ = []
change2Camel' (x:xs) True = C.toUpper x : change2Camel' xs False
change2Camel' (x:xs) False
  | x == '_' = change2Camel' xs True
  | otherwise = x : change2Camel' xs False

change2Camel :: String -> String
change2Camel snakeCasedWord     = change2Camel' snakeCasedWord False

-- uncomment appropriate line below and copy-paste the snippet to ghci (REPL):
-- map change2Camel ["hello_world", "nice_to_meet_you", "translate_to_english"]
