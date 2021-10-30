transpose :: String -> String
transpose text = unlines $ transpose' $ lines text

transpose' :: [String] -> [String]
transpose' linesOfText = if any null linesOfText then []
  else (map head linesOfText) : transpose' (map tail linesOfText)
