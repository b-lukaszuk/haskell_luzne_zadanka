-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
-- nothing to import here


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
peopleInCave :: [Int]
peopleInCave = [1..7]


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
moveToEnd :: [Int] -> [Int]
moveToEnd [] = []
moveToEnd (x:xs) = xs ++ [x]

killFirst :: [Int] -> [Int]
killFirst [] = []
killFirst xs = drop 1 xs

declareSingleKill :: [Int] -> String
declareSingleKill [] = "all people in the cave are dead"
declareSingleKill (x:xs) = if null xs
                     then (show x) ++ " remains alive"
                     else (show x) ++ " kills " ++ (show $ head xs)

-- initial invocation getKillingSpree [1..5] []
getKillingSpree :: [Int] -> [String] -> [String]
getKillingSpree [] declarations = reverse declarations
getKillingSpree xs declarations =
  let curDeclaration = declareSingleKill xs
      newDeclarations = curDeclaration : declarations
      xsFirstToEnd = moveToEnd xs
      newXs = killFirst xsFirstToEnd
  in getKillingSpree newXs newDeclarations


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn $ "At first there are " ++ (show $ length peopleInCave) ++
    " in the cave:"
  putStrLn $ show peopleInCave
-- unlines creates a string from an array of strings, it inserts new
-- line characters between original strings
  putStrLn $ unlines $ getKillingSpree peopleInCave []
