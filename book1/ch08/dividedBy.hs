-- fixing dividedBy
dividedBy :: Integral a => a -> a -> Maybe (a, a)
dividedBy num denom = if denom == 0
  then Nothing
  else go num denom 0
  where go n d count
          | n < d = Just (count, n)
          | otherwise = go (n - d) d (count + 1)
