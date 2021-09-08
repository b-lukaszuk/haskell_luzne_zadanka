module Main where

import Control.Monad (forever)
import System.Exit (exitSuccess)

main :: IO()
main = forever $ do
  putStrLn "Type a word and I will check if it's a palindrome"
  line1 <- getLine
  if (line1 == reverse line1)
    then do
    putStrLn "It's a palindrome!"
    else do
    putStrLn "Nope!"
    exitSuccess
