-------------------------------------------------------------------------------
--                        solution with tail recursion                       --
-------------------------------------------------------------------------------
-- duplicate' :: [a] -> [a] -> [a]
-- duplicate' [] acc     = reverse acc
-- duplicate' (x:xs) acc = duplicate' xs (x:x:acc)

-- duplicate :: [a] -> [a]
-- duplicate xs = duplicate' xs []

-------------------------------------------------------------------------------
--                           solution with foldr                             --
-------------------------------------------------------------------------------
duplicate :: [a] -> [a]
duplicate = foldr (\cur acc -> cur:cur:acc) []

getExampleInfo :: (Show a) => [a] -> String
getExampleInfo l = show l ++ " => " ++ show (duplicate l)

main :: IO ()
main = do
  putStrLn "Duplicating elements of a list."
  putStrLn "Examples:\n"
  let l1 = ["a", "b", "c", "c", "d"]
  let l2 = [1..4]
  putStrLn $ getExampleInfo l1
  putStrLn $ getExampleInfo l2
  putStrLn "\nThat's all. Goodbye!"
