-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
-- nothing to import here

-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
word1 :: String
word1 = "abc"

sentence1 :: String
sentence1 = "ala ma kota"

-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
revString :: String -> String
revString xs = foldl (\acc x -> x:acc) [] xs

declareReversing :: String -> String
declareReversing x = "'" ++ x ++ "'" ++ " reversed is: '"
                     ++ revString x ++ "'"

-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "Hello there. Let's reverse some strings"
  putStrLn $ declareReversing word1
  putStrLn $ declareReversing sentence1
  putStrLn "That's all. Goodbye!"
