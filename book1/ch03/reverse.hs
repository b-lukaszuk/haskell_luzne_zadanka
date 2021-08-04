module Reverse where

text1 :: String
text1 = "Curry is awesome"

rvrs :: String -> String
rvrs x = (drop 9 x) ++ " " ++ (take 3 $ drop 6 x) ++ (take 5 x)

main :: IO()
main = do
  putStrLn "After reversing word order in the sentence:"
  putStrLn $ "<<" ++ text1 ++ ">>"
  putStrLn "we get:"
  putStrLn $ "<<" ++ rvrs text1 ++ ">>"
