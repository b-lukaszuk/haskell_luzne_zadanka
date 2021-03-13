-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
years :: [Int]
years = [1974, 1900, 1985, 2000]


-------------------------------------------------------------------------------
--                              funkcje                                      --
-------------------------------------------------------------------------------
-- za: https://en.wikipedia.org/wiki/Leap_year#Algorithm
isLeap :: Int -> Bool
isLeap year
  | mod year 4 /= 0 = False
  | mod year 25 /= 0 = True
  | mod year 16 /= 0 = False
  | otherwise = True


getLeapYears :: [Int] -> [Int]
getLeapYears years = filter isLeap years
