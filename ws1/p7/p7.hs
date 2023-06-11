-------------------------------------------------------------------------------
--                   flattens list of lists with recursion                   --
-------------------------------------------------------------------------------
-- flattenList :: [[a]] -> [a]
-- flattenList []     = []
-- flattenList (x:xs) = x ++ flattenList xs

-------------------------------------------------------------------------------
--                   flattens list of lists with foldr                       --
-------------------------------------------------------------------------------
flattenList :: [[a]] -> [a]
flattenList = foldr (++) []

getExampleInfo :: (Show a) => [[a]] -> String
getExampleInfo lol = (show lol) ++ " => " ++ show (flattenList lol)

main :: IO ()
main = do
  let lol1 = [[1..3], [4..6], [7..10]] :: [[Int]]
  let lol2 = ["one, ", "two, ", "three"]
  print "Flattening list of lists example"
  print $ getExampleInfo lol1
  print $ getExampleInfo lol2
  print "That's all. Goodbye!"
