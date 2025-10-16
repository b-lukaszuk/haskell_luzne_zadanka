import Control.Concurrent (threadDelay)
import Control.Monad (forM_)

getProgressBar :: Int -> String -> String
getProgressBar perc fan
  | perc < 0 || perc > 100 = undefined
  | otherwise = ps ++ qs ++ " " ++ show perc ++ "%" ++ " " ++ fan
  where maxNumOfChars = 50
        p = round (fromIntegral perc / (100 / fromIntegral maxNumOfChars))
        ps = take p $ repeat '|'
        q = maxNumOfChars - p
        qs = take q $ repeat '.'

animate1Frame :: Int -> String -> IO ()
animate1Frame perc fan = do
  print $ getProgressBar perc fan
  threadDelay $ 200 * 1000

fans :: [String]
fans = ["\\", "-", "/", "-"]

main :: IO()
main = forM_ [0..100] $ \i -> do
  animate1Frame i (fans !! (mod i $ length fans))

