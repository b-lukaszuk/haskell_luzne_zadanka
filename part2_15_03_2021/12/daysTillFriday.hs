-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import System.IO
import System.Directory
import System.Process

-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
enumDaysOfWeek :: [(Int, String)]
enumDaysOfWeek = zip [0..] ["Fri", "Sat", "Sun", "Mon", "Tue", "Wed", "Thu"]

-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
getDayOfWeek :: String -> String
getDayOfWeek bashDateStr = words bashDateStr !! 0

daysTill :: String -> String -> Int
daysTill today dayOfWeek =
  let todayInd = [ind | (ind, day) <- enumDaysOfWeek, today == day] !! 0
      dayOfWeekInd = [ind | (ind, day) <- enumDaysOfWeek, dayOfWeek == day] !! 0
      daysPerWeek = length enumDaysOfWeek
      daySpan = if dayOfWeekInd > todayInd
        then dayOfWeekInd - todayInd
        else if dayOfWeekInd < todayInd -- szukamy do przodu (nast. piatku)
             then daysPerWeek - (mod todayInd $ daysPerWeek)
             else 0
  in daySpan

-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  -- creating empty tmp file (name tmpSthRandom)
  (tmpName, tmpHandle) <- openTempFile "." "temp"
  hClose tmpHandle
  -- insert result of bash date command into that tmp file
  callCommand $ "date > " ++ tmpName
  todayDate <- readFile tmpName
  let todayDayOfWeek = getDayOfWeek todayDate
      daysTillFriday = daysTill todayDayOfWeek "Fri"
  putStrLn $ "Today is: " ++ todayDayOfWeek
  putStrLn $ "Days till Fri: " ++ show daysTillFriday
  removeFile tmpName -- remove tmpFile

-- ehh, zdaje sie, ze takze obsluga czasow jest nieporeczna w haskellu
-- a moze mam jeszcze za niski poziom znajomosci tego jezyka programowania
