myConcat :: [[a]] -> [a]
myConcat lstOfLsts = foldr (\curVal acc -> curVal ++ acc) [] lstOfLsts
