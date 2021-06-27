module ListOfSubstrings
  (
    getAllSubstrings
  ) where

-- helper function
getSubstrOfLen' :: Int -> String -> [String] -> [String]
getSubstrOfLen' n xs prevSubstrings
  | n > xsLen = prevSubstrings
  | n == xsLen = prevSubstrings ++ [xs]
  | otherwise = getSubstrOfLen' n newXs newSubstrings
  where xsLen = length xs
        newXs = drop 1 xs
        newSubstrings = prevSubstrings ++ [take n xs]

getSubstrOfLen :: Int -> String -> [String]
getSubstrOfLen 0 _ = []
getSubstrOfLen n xs = getSubstrOfLen' n xs []

getAllSubstrOfLenLT :: Int -> String -> [String]
getAllSubstrOfLenLT 0 _ = []
getAllSubstrOfLenLT n xs = getSubstrOfLen (n - 1) xs ++
                           getAllSubstrOfLenLT (n-1) xs

getAllSubstrings :: String -> [String]
getAllSubstrings xs = getAllSubstrOfLenLT (length xs + 1) xs
