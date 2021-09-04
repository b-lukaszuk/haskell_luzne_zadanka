module Unfolds where


-- case 1
-- not sure what's the difference between direct recursion and recursion
myIterate :: (a -> a) -> a -> [a]
myIterate fn x = x : myIterate fn (fn x)


-- case 2
-- again, I'm not sure what direct recursion is.
-- what a strange function (signature), what is it suppose to do?
-- solution found on the internet (but what it is all about?)
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr fn x =
  case fn x of -- why do I have to check the case of fn x and not only fn?
    Nothing -> []
    Just (y, z) -> y : myUnfoldr fn z


-- case 3
-- I created it myself based on hunch and incomplete understanding of myUnfoldr
-- but it seems to work correclty
betterIterate :: (a -> a) -> a -> [a]
betterIterate f x = myUnfoldr (\b -> Just (b, f b)) x
