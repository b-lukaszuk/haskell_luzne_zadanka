stops = "pbtdkg"
vowels = "aeiou"


-- case 1
getCombinations :: String -> String -> [(Char, Char)]
getCombinations set1 set2 = [(x, y) | x <- set1, y <- set2]


-- case 2
getCombinationsWithAorP :: String -> String -> [(Char, Char)]
getCombinationsWithAorP set1stops set2vowels =
  [(x, y) | x <- set1stops, y <- set2vowels, x == 'p' || y == 'a']
