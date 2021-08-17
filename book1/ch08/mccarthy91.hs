mc91 :: (Num a, Ord a) => a -> a
mc91 n = if n > 100 then n - 10 else mc91 (mc91 (n+11))
