isPalindrome :: (Eq a) => [a] -> Bool
isPalindrome xs = xs == reverse xs

getExampleInfo :: String -> String
getExampleInfo l = l ++ " => " ++ show (isPalindrome l)

main :: IO ()
main = do
  let ls = ["peter", "abba", "civic", "madam", "radar", "jerry"]
  print "Testing lists for being palindromes examples"
  mapM_ (print . getExampleInfo) ls
