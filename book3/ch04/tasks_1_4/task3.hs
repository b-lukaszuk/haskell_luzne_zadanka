import System.Exit (exitSuccess)

getFirstWord :: String -> String
getFirstWord lineOfText = head $ words lineOfText

getUserInputAndPrintFirstWord :: IO ()
getUserInputAndPrintFirstWord = do
  userInput <- getLine
  if null userInput
    then do
    putStrLn "That's all. Goodbye!"
    exitSuccess
    else do
    putStrLn $ getFirstWord userInput
  getUserInputAndPrintFirstWord

main :: IO ()
main = do
  putStrLn "Hello. Type your text and press Enter and I'll print the first word"
  putStrLn "Enter an empty line (just press Enter, nothing more) to end the program\n"
  getUserInputAndPrintFirstWord
