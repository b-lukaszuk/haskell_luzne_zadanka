-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import qualified Data.Map as Map


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
num1 :: Double
num1 = 4
num2 :: Double
num2 = 2

results :: Map.Map String Double
results = Map.fromList $ perf4mathOpers num1 num2


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
perf4mathOpers :: (Eq a, Fractional a) => a -> a -> [(String, a)]
perf4mathOpers x y =
  let addition = x + y
      subtraction = x - y
      multiplication = x * y
      division = if y /= 0 then x / y else x / 1
  in [("addition", addition),
  ("subtraction", subtraction),
  ("multiplication", multiplication),
  ("division", division)]


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "For basic mathematical operations performed on:"
  putStrLn $ show num1 ++ " " ++ show num2
  putStrLn "give the following results:"
  putStrLn $ show results
