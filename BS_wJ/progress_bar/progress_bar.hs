import           Control.Concurrent (threadDelay)
import           Control.Monad      (forM_)
import           Data.Char          (isSpace, toLower)

getProgressBar :: Int -> String -> String
getProgressBar perc fan
  | perc < 0 || perc > 100 = undefined
  | otherwise = ps ++ qs ++ " " ++ show perc ++ "%" ++ " " ++ fan
  where maxNumOfChars = 50
        p = round (fromIntegral perc / (100 / fromIntegral maxNumOfChars))
        ps = take p $ repeat '|'
        q = maxNumOfChars - p
        qs = take q $ repeat '.'

strip :: String -> String
strip s = filter (not . isSpace) s

-- the terminal must support ANSI escape codes
-- https://en.wikipedia.org/wiki/ANSI_escape_code
clearPrevLine :: IO ()
clearPrevLine = do
    -- "\033[xxxA" - xxx moves cursor up xxx lines
    -- in haskell you use hex code instead of octal, hence "\033" is "\x1b"
    putStr "\x1b[A"
    -- clears from cursor position till end of display
    putStr "\x1b[J"

animate1Frame :: Int -> String -> IO ()
animate1Frame perc fan = do
  putStrLn $ getProgressBar perc fan
  threadDelay $ 150 * 1000 -- delay: 150 ms
  clearPrevLine

-- run program from shell with: runhaskell progress_bar.hs
main :: IO()
main = do
  putStrLn $ "Toy program."
  putStrLn $ "It animates a progress bar."
  putStrLn $ "Note: your terminal must support ANSI escape codes.\n"
  putStrLn $ "Continue with the animation? [Y/n]"
  fans <- return ["\\", "-", "/", "-"]
  choice <- getLine
  if (map toLower $ strip choice) `elem` ["y", "yes", ""]
    then do
    forM_ [0..100] $ \i -> animate1Frame i (fans !! (mod i $ length fans))
    putStrLn $ getProgressBar 100 (fans !! 0)
  else putStr $ ""
  putStrLn $ "\nThat's all. Goodbye!"
