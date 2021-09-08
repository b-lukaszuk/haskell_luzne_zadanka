module Main where

import Person (gimmePerson)

main :: IO ()
main = do
  gimmePerson
  putStrLn $ "\nThat's all. Goodbye!"
