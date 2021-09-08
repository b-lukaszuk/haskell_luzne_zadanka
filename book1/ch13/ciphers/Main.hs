module Main where

import Vigenere (codeMsg, decodeMsg)

codeKey :: String
codeKey = "wednesday"

introMsg :: String
introMsg = "\nHello. Wellcome to my simple coding decoding program\n" ++
           "Type a message (only small letters) " ++
           "and code (c) or decode (d) it.\n" ++
           "The program uses simple Vigenere cipher\n"

outroMsg :: String
outroMsg = "\nThat's all. Goodbye!\n"

coding :: String -> IO ()
coding msg = do
  putStrLn $ codeMsg codeKey msg

decoding :: String -> IO ()
decoding msg = do
  putStrLn $ decodeMsg codeKey msg

handleUserInput :: IO ()
handleUserInput = do
  putStrLn $ "Would you like to: code (c) or decode (d) a message?"
  action <- getLine
  putStrLn $ "\nPlease type your message:"
  msg <- getLine
  putStrLn $ "\nAfter transformation your message is:"
  if action == "c"
    then coding msg
    else decoding msg

main :: IO ()
main = do
  putStrLn $ introMsg
  handleUserInput
  putStrLn $ outroMsg
