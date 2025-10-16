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

-- the terminal must support ANSI escape codes
-- https://en.wikipedia.org/wiki/ANSI_escape_code
clear1Line :: IO ()
clear1Line = do
    -- "\033[xxxA" - xxx moves cursor up xxx lines
    -- in haskell you use hex code instead of octal, hence "\033" is "\x1b"
    putStr "\x1b[A"
    -- clears from cursor position till end of display
    putStr "\x1b[J"

animate1Frame :: Int -> String -> IO ()
animate1Frame perc fan = do
  putStrLn $ getProgressBar perc fan
  threadDelay $ 150 * 1000 -- delay: 150 ms
  clear1Line

fans :: [String]
fans = ["\\", "-", "/", "-"]

-- run program from shell with: runhaskell progress_bar.hs
main :: IO()
main = do
  forM_ [0..100] $ \i -> do
    animate1Frame i (fans !! (mod i $ length fans))
  putStrLn $ getProgressBar 100 (fans !! 0)
