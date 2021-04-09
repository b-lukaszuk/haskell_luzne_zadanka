-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import System.IO
import System.Directory
import System.Process
import Data.List

-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
getDayOfWeek :: String -> String
getDayOfWeek bashDateStr = words bashDateStr !! 0

engToPolDaysOfWeek :: [(String, String)]
engToPolDaysOfWeek = [("Sun", "Niedziela"), ("Mon", "Poniedzialek"),
                     ("Tue", "Wtorek"), ("Wed", "Sroda"),
                     ("Thu", "Czwartek"), ("Fri", "Piatek"),
                     ("Sat", "Sobota")]

getPolDayOfWeek :: String -> String
getPolDayOfWeek dayOfWeekEng = [dPl | (dEn, dPl) <- engToPolDaysOfWeek,
                                dEn == dayOfWeekEng] !! 0
-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  -- creating empty tmp file (name tmpSthRandom)
  (tmpName, tmpHandle) <- openTempFile "." "temp"
  hPutStr tmpHandle "that's all"
  hClose tmpHandle
  -- insert result of bash date command into that tmp file
  callCommand $ "date > " ++ tmpName
  todayDate <- readFile tmpName
  let todayDayOfWeekEn = getDayOfWeek todayDate
  putStrLn $ "Today is: " ++ getPolDayOfWeek todayDayOfWeekEn
  removeFile tmpName -- remove tmpFile

-- ehh, zdaje sie, ze takze obsluga czasow jest nieporeczna w haskellu
-- a moze mam jeszcze za niski poziom znajomosci tego jezyka programowania
