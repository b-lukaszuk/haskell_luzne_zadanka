myAny :: (a -> Bool) -> [a] -> Bool
myAny _ [] = False
myAny pred (x:xs) = if pred x then True else myAny pred xs

myCycle :: [a] -> [a]
myCycle [] = error "empty list"
myCycle xs = xs ++ myCycle xs

-- copy of task2.hs from this chapter's tasks
-- returns list of elements up until the first unfulfilled condition
getWhileFalse :: (a -> Bool) -> [a] -> [a]
getWhileFalse _ [] = []
getWhileFalse f (x:xs) = if (f x) then [] else x : getWhileFalse f xs

-- returns list of elements after the first element that fulfills condition
getAfterTrue :: (a -> Bool) -> [a] -> [a]
getAfterTrue _ [] = []
getAfterTrue f (x:xs) = if (f x) then xs else getAfterTrue f xs

splitWith :: (a -> Bool) -> [a] -> [[a]]
splitWith _ [] = []
splitWith f xs =
  let begining = getWhileFalse f xs
      rest = getAfterTrue f xs
  in begining : splitWith f rest
-- copy of task2.hs from this chapter's tasks

myWords :: String -> [String]
myWords xs = splitWith (== ' ') xs

myUnlines :: [String] -> String
myUnlines [] = ""
myUnlines (x:xs) = x ++ "\n" ++ myUnlines xs
