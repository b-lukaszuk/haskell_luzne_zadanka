{-# LANGUAGE FlexibleInstances #-}

module LogicGoats where

class TooMany a where
  tooMany :: a -> Bool

instance TooMany Int where
  tooMany n = n > 42

-- original declaration 1
-- newtype Goats = Goats Int deriving Show
-- instance TooMany Goats where
--   tooMany (Goats n) = n > 43

-- original declaration 2
-- with pragma {-# LANGUAGE GeneralizedNewtypeDeriving #-}
-- newtype Goats = Goats Int deriving (Eq, Show, TooMany)


-- case 1
-- newtype Goats = Goats (Int, String) deriving Show

-- instance TooMany Goats where
--   tooMany (Goats (n, "bucks")) = n > 20
--   tooMany (Goats (n, "billies")) = n > 20
--   tooMany (Goats (n, "does")) = n > 43
--   tooMany (Goats (n, "nannies")) = n > 43
--   tooMany (Goats (_, _)) = error "Goats must be male or female"


-- case 2
newtype Goats = Goats (Int, Int) deriving Show

instance TooMany Goats where
  tooMany (Goats (field1Count, field2Count)) =  (field1Count + field2Count) > 43


-- case 3
instance (Num a, TooMany a) => TooMany (a, a) where
  tooMany (x, y) = tooMany x || tooMany y
