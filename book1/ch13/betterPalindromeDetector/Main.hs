module Main where

import Control.Monad (forever)
import System.Exit (exitSuccess)
import Data.Char (toLower)

leaveAtoZ :: String -> String
leaveAtoZ xs = filter (\x -> elem x ['a'..'z']) xs

strToLower :: String -> String
strToLower xs = map toLower xs

isPalindrome :: String -> Bool
isPalindrome text =
  let textToCheck = leaveAtoZ $ strToLower text
  in textToCheck == reverse textToCheck

main :: IO()
main = forever $ do
  putStrLn "Type a word and I will check if it's a palindrome"
  line1 <- getLine
  if (isPalindrome line1)
    then do
    putStrLn "It's a palindrome!"
    else do
    putStrLn "Nope!"
    exitSuccess
