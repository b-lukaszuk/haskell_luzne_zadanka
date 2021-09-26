module OptionalMonoid where

import Data.Monoid

data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty = Nada

instance Semigroup a => Semigroup (Optional a) where
  Nada <> (Only a) = Only a
  (Only a) <> Nada = Only a
  (Only x) <> (Only y) = Only (x <> y)
  Nada <> Nada = Nada

n1 :: Integer
n1 = 1
n2 :: Integer
n2 = 2
n4 :: Integer
n4 = 4

main :: IO()
main = do
  putStrLn "Testing Monoid instances for the type: Optional"
  putStrLn "\nOnly (Sum 1) `mappend` Only (Sum 1) gives:"
  putStrLn $ show $ Only (Sum n1) `mappend` Only (Sum n1)
  putStrLn "\nOnly (Product 4) `mappend` Only (Product 2) gives:"
  putStrLn $ show $ Only (Product n4) `mappend` Only (Product n2)
  putStrLn "\nOnly (Sum 1) `mappend` Nada gives:"
  putStrLn $ show $ Only (Sum n1) `mappend` Nada
  putStrLn "\nOnly [1] `mappend` Nada gives:"
  putStrLn $ show $ Only [n1] `mappend` Nada
  putStrLn "\nNada `mappend` Only (Sum 1) gives:"
  putStrLn $ show $ Nada `mappend` Only (Sum n1)
  putStrLn "\nThats all. Goodbye."
