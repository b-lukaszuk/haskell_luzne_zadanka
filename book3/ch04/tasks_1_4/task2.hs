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
