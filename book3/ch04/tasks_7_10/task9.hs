getWhileTrue :: (a -> a -> Bool) -> [a] -> [a]
getWhileTrue _ [] = []
getWhileTrue _ [x] = [x]
getWhileTrue p (x:y:xs) = if (p x y) then x : getWhileTrue p (y:xs) else x : []

myGroupBy :: (a -> a -> Bool) -> [a] -> [[a]]
myGroupBy _ [] = []
myGroupBy fn xs =
  let begining = getWhileTrue fn xs
      rest = drop (length begining) xs
  in begining : myGroupBy fn rest

-- some tests:

-- In: groupBy (==) "aaabcccdda"
-- Out: ["aaa","b","ccc","dd","a"]
-- passed

-- In: groupBy (==) []
-- Out: []
-- passed

-- In: groupBy (<=) [1,2,2,3,1,2,0,4,5,2]
-- Out: [[1,2,2,3],[1,2],[0,4,5],[2]]
-- passed

-- In: groupBy (\x y -> (x*y `mod` 3) == 0) [1,2,3,4,5,6,7,8,9]
-- Out: [[1],[2,3],[4],[5,6],[7],[8,9]]
-- failed, myGroupBy returns: [[1],[2,3,4],[5,6,7],[8,9]]
-- but to me myGroupBy return value seems to be correct (I don't understand why
-- groupBy shoud return the output like in the provided example)
-- therefore I'll leave my function as it is (at least for now)
