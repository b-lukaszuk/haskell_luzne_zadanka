-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
lstOfWords :: [String]
lstOfWords = [ "Politechnika1", "Karol", "Adam", "Rogowski",
               "Politechnika2", "Super", "Weekend"]


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- zwraca najdluzsze slowo (pierwsze od lewej) z listy
getLongestWord :: [String] -> String
getLongestWord lstOfWords = foldl1
  (\acc w -> if length w > length acc then w else acc)
  lstOfWords


-- zwraca najdluzsze slowo (lub kilka rownie dlugich) z listy
getLongestWords :: [String] -> [String]
getLongestWords (w:ws)= foldl
  (\acc curWord ->
     if length curWord > length (acc !! 0) then [curWord]
     else if length curWord == length (acc !! 0) then acc ++ [curWord]
     else acc)
  [""] (w:ws)

