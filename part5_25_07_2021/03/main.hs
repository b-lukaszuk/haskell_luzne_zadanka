-------------------------------------------------------------------------------
--                                  task 3.1                                 --
-------------------------------------------------------------------------------
safeHead :: [a] -> Maybe a
safeHead [] = Nothing
safeHead (x:xs) = Just x

safeTail :: [a] -> Maybe [a]
safeTail [] = Nothing
safeTail (x:xs) = Just xs

safeLast :: [a] -> Maybe a
safeLast [] = Nothing
safeLast (x:xs) = if null xs then Just x else safeLast xs

safeInit :: [a] -> Maybe [a]
safeInit [] = Nothing
safeInit xs = Just $ safeInit' xs

safeInit' :: [a] -> [a]
safeInit' [] = []
safeInit' (x:xs) = if null xs then [] else x : safeInit' xs


-------------------------------------------------------------------------------
--                                  task 3.2                                 --
-------------------------------------------------------------------------------
-- tail function similar to the one in common lisp
clTail :: [a] -> [a]
clTail [] = []
clTail (x:xs) = xs

-- splits list at elements where predicate is/are False
-- the stop/split elements do not belong to the result
splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith predicate xs =
  let (begin, rest) = break predicate xs
  in if null begin
     then splitWith predicate (clTail rest)
     else [begin] ++ splitWith predicate (clTail rest)


------------------------------------------------------------------------------
--                                  task 3.3                                 --
-------------------------------------------------------------------------------
-- I'll skip the file part for now (it's not crucial here)
textFromAfile :: String
textFromAfile = "hello\nworld\n"

-- https://stackoverflow.com/questions/2578930/understanding-this-matrix-transposition-function-in-haskell
transpose :: [[a]] -> [[a]]
transpose ([]:_) = []
transpose xs = (map head xs) : transpose (map tail xs)

transposeText :: String -> String
transposeText someText = unlines $ transpose $ lines someText
