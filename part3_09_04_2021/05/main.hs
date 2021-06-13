-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import System.Random


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
-- nothing to declare here


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
parseInt :: String -> Int
parseInt strNum = read strNum :: Int

declareResulOfComparison :: String -> Int -> String
declareResulOfComparison guess secretNum =
  if secretNum < parseInt guess then "Lower" else
    if secretNum > parseInt guess then "Higher"
    else "That's it. It was " ++ guess

handleUserGuesses :: Int -> IO()
handleUserGuesses secretNum = do
    putStrLn "Enter Your guess:"
    curGuess <- getLine
    putStrLn $ declareResulOfComparison curGuess secretNum
    if secretNum == parseInt curGuess
      then return ()
      else handleUserGuesses secretNum

-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  gen <- getStdGen
  let (secretNum, _) = randomR (1, 100) gen :: (Int, StdGen)
  putStrLn "I have chosen a number between 1 and 100. Can You guess it?"
  handleUserGuesses secretNum
