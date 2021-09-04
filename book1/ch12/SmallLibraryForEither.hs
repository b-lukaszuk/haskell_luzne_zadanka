module SmallLibraryForEither where


-- case 1
isLeft :: Either a b -> Bool
isLeft (Left _) = True
isLeft _ = False

getLeft :: Either a b -> a
getLeft (Left x) = x
getLeft _ = error "I accept only Left part of Either"

lefts' :: [Either a b] -> [a]
lefts' eithers = foldr (\e acc ->
                          if isLeft e
                          then (getLeft e) : acc
                          else acc)
                 [] eithers


-- case 2
isRight :: Either a b -> Bool
isRight e = not $ isLeft e

getRight :: Either a b -> b
getRight (Right x) = x
getRight _ = error "I accept only Right part of Either"

rights' :: [Either a b] -> [b]
rights' eithers = foldr (\e acc ->
                          if isRight e
                          then (getRight e) : acc
                          else acc)
                 [] eithers


-- case 3
partitionEithers' :: [Either a b] -> ([a], [b])
partitionEithers' eithers = (lefts' eithers, rights' eithers)


-- case 4
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe' _ (Left _) = Nothing
eitherMaybe' fn (Right x) = Just $ fn x


-- case 5
either' :: (a -> c) -> (b -> c) -> Either a b -> c
either' f _ (Left x) = f x
either' _ g (Right y) = g y


-- case 6
eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
eitherMaybe'' _ (Left _) = Nothing
eitherMaybe'' g (Right x) = Just $ either' id g (Right x)
