-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
-- nothing to import here

-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
int1 :: Int
int1 = 1234

int2 :: Int
int2 = 987

-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
revNumber :: Int -> Int
revNumber num =
  let numAsString = show num
      revNumAsString = foldl (\acc x -> x:acc) [] numAsString
  in read revNumAsString :: Int

declareReversing :: Int -> String
declareReversing x =
  let numBefore = show x
      numAfter = show $ revNumber x
      in numBefore ++ " reversed is: " ++ numAfter


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "Hello there. Let's reverse some ints"
  putStrLn $ declareReversing int1
  putStrLn $ declareReversing int2
  putStrLn "That's all. Goodbye!"
