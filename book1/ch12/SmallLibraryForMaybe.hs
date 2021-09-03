module SmallLibraryForMaybe where


-- case 1
isJust :: Maybe a -> Bool
isJust Nothing = False
isJust _ = True


-- case 2
mayybee :: b -> (a -> b) -> Maybe a -> b
mayybee acc _ Nothing = acc
mayybee _ fn (Just sth) = fn sth
-- is that it?


-- case 3
fromMaybe :: a -> Maybe a -> a
fromMaybe fallback sth = mayybee fallback id sth


-- case 4
listToMaybe :: [a] -> Maybe a
listToMaybe [] = Nothing
listToMaybe (x:_) = Just x

maybeToList :: Maybe a -> [a]
maybeToList Nothing = []
maybeToList (Just sth) = [sth]


-- case 5
catMaybes :: [Maybe a] -> [a]
catMaybes lstOfMaybe = map (\(Just x) -> x) $ filter isJust lstOfMaybe


-- case 6
flipMaybe :: (Eq a) => [Maybe a] -> Maybe [a]
flipMaybe lstOfMaybe = if elem Nothing lstOfMaybe
                       then Nothing
                       else Just $ catMaybes lstOfMaybe
