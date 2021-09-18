module Test where

import Test.QuickCheck
import Case1 (eqlFool)
import Case2 (gen5to1)

main :: IO()
main = do
  putStrLn "\n=============="
  putStrLn "Testing Case 1"
  putStrLn "Generating sample of Fool's with equal probability"
  do sample eqlFool
  putStrLn "\n=============="
  putStrLn "Testing Case 2"
  putStrLn "Generating sample of Fool''s with probability 5 (Fulse') to 1 (Frue')"
  do sample gen5to1
  putStrLn "\n=============="
  putStrLn "That's all folks. Goodbye"
