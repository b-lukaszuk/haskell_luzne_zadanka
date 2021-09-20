module Test where

import Test.QuickCheck
import qualified Caesar as C
import qualified Vigenere as V

-- warning, Caesar code only a-z, they return other Chars unchanged
propCaesar :: String -> Bool
propCaesar someMsg =
  let codedMsg = C.codeMsg 3 someMsg
  in someMsg == C.decodeMsg 3 codedMsg

-- warning, Vigenere code only a-z, they return other Chars unchanged
propVigenere :: String -> Bool
propVigenere someMsg =
  let codedMsg = V.codeMsg "tarantula" someMsg
  in someMsg == V.decodeMsg "tarantula" codedMsg

main :: IO()
main = do
  putStrLn "\n=============="
  putStrLn "Testing Caesar cipher"
  putStrLn "Coding with shift 13:"
  quickCheck propCaesar
  putStrLn "Testing Vigenere cipher"
  putStrLn "Coding with codekey <<tarantula>>"
  quickCheck propVigenere
  putStrLn "That's all folks. Goodbye"
