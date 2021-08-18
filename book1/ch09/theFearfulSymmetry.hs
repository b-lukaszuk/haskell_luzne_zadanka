-- I'll do case 3 right away
-- case 3

-- safer tail function, acting like its counterpart in Common Lisp
clTail :: [a] -> [a]
clTail [] = []
clTail (x:xs) = xs

strSplit sep [] = []
strSplit sep text =
  let predicate = (\x -> x /= sep)
      firstPart = takeWhile predicate text
      rest = clTail $ dropWhile predicate text
  in [firstPart] ++ strSplit sep rest
