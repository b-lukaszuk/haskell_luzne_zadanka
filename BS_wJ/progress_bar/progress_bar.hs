getProgressBar :: Int -> String -> String
getProgressBar perc fan
  | perc < 0 || perc > 100 = undefined
  | otherwise = ps ++ qs ++ " " ++ show perc ++ "%" ++ " " ++ fan
  where maxNumOfChars = 50
        p = round (fromIntegral perc / (100 / fromIntegral maxNumOfChars))
        ps = take p $ repeat '|'
        q = maxNumOfChars - p
        qs = take q $ repeat '.'

animateProgressBar :: [String]
animateProgressBar = [getProgressBar p f | p <- percs, f <- fans]
  where
    percs = [0..100]
    fans = (take $ length percs) $ ["\\", "-", "/", "-"]

main = do
  mapM_ putStrLn animateProgressBar
