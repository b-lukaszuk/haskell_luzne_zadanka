takeWhileRec :: (a -> Bool) -> [a] -> [a]
takeWhileRec _ [] = []
takeWhileRec pred (x:xs) = if pred x then x : takeWhileRec pred xs else []

takeWhileFoldr :: (a -> Bool) -> [a] -> [a]
takeWhileFoldr pred xs = foldr
  (\cur acc -> if pred cur then cur : acc else [])
  [] xs
