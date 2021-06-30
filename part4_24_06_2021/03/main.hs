-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import FindOverlap (findOverlapingString)


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
pairsOfWords :: [(String, String)]
pairsOfWords = [
  ("Lorem ipsum dolor sit amet.", "Dolor at pulvo ni soda."),
  ("rak", "kajak"),
  ("medicine", "house med. dr"),
  ("ala", "emu"),
  ("ala", "")
 ]


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
findOverlap :: (String, String) -> String
findOverlap (word1, word2) =
  let result = findOverlapingString word1 word2
  in case result of
    Nothing -> "No overlap found"
    Just value -> value

declareOverlap :: (String, String) -> String
declareOverlap (word1, word2) =
  let sep = "==="
      intro = "Comparing <<" ++ word1 ++ ">> & <<" ++ word2 ++ ">> for overlap"
      result = findOverlap (word1, word2)
  in unlines $ [sep, intro, "result: " ++ result, sep]


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "Hello. Let's check some strings for overlap\n\n"
  putStrLn $ unlines $ map declareOverlap pairsOfWords
  putStrLn "That's it. Goodbye!"
