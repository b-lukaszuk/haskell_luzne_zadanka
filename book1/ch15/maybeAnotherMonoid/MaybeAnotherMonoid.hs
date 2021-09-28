module MaybeAnotherMonoid where

import Data.Monoid
import Test.QuickCheck

-- code from the section 'Optional Monoid` in this chapter (ch 15)
data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
  mempty = Nada

instance Semigroup a => Semigroup (Optional a) where
  Nada <> (Only a) = Only a
  (Only a) <> Nada = Only a
  (Only x) <> (Only y) = Only (x <> y)
  Nada <> Nada = Nada

-- provided scaffolding + my code
newtype First' a = First' { getFirst' :: Optional a } deriving (Eq, Show)

-- my solution, monoid for Maybe which doesn't require monoid for the contents
data Maybe' a = Nothing' | Just' deriving (Eq, Show)

instance Monoid (Maybe' a) where
  mempty = Nothing'

instance Semigroup (Maybe' a) where
  Nothing' <> _ = Nothing'
  _ <> Nothing' = Nothing'
  Just' <> Just' = Just'

-- instance Monoid (First' a) where
-- 	mempty = undefined
-- 	mappend = undefined

-- firstMappend :: First' a -> First' a -> First' a
-- firstMappend = mappend

type FirstMappend = First' String -> First' String -> First' String -> Bool
type FstId = First' String -> Bool

-- main :: IO ()
-- main = do
-- 	quickCheck (monoidAssoc :: FirstMappend)
-- 	quickCheck (monoidLeftIdentity :: FstId)
-- 	quickCheck (monoidRightIdentity :: FstId)
