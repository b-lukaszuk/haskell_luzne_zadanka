-------------------------------------------------------------
-- Exercises: Eq Instances
-- write the Eq instances for the datatype provided
-- (checked for correctness, by typing ':set -Wall' in GHCi)
-- (it warns from non-exhaustive definitions of Eq instances)
-------------------------------------------------------------


-------------------------------------------------------------
-- case 1
-- it's not a typo, we're just being cute with the name
data TisAnInteger =
  TisAn Integer

-- my solution
instance Eq TisAnInteger where
  (==) (TisAn int1) (TisAn int2) = int1 == int2


-------------------------------------------------------------
-- case 2
data TwoInteger =
  Two Integer Integer

-- my solution
instance Eq TwoInteger where
  (==) (Two int1 int2) (Two int1' int2') =
    int1 == int1' && int2 == int2'


-------------------------------------------------------------
-- case 3
data StringOrInt =
  TisAnInt Int | TisAString String

-- my solution
instance Eq StringOrInt where
  (==) (TisAnInt _) (TisAString _) = False
  (==) (TisAString _) (TisAnInt _) = False
  (==) (TisAnInt int1) (TisAnInt int1') = int1 == int1'
  (==) (TisAString string1) (TisAString string1') = string1 == string1'


-------------------------------------------------------------
-- case 4
data Pair a = Pair a a

-- my solution
instance Eq a => Eq (Pair a) where
  (==) (Pair a1 a2) (Pair a1' a2') = a1 == a1' && a2 == a2'


-------------------------------------------------------------
-- case 5
data Tuple a b = Tuple a b

-- my solution
instance (Eq a, Eq b) => Eq (Tuple a b) where
  (==) (Tuple a b) (Tuple a' b') = a == a' && b == b'


-------------------------------------------------------------
-- case 6
data Which a = ThisOne a | ThatOne a

-- my solution
instance Eq a => Eq (Which a) where
  (/=) (ThisOne _) (ThatOne _) = True
  (/=) (ThatOne _) (ThisOne _) = True
  (/=) (ThisOne a) (ThisOne a') = a /= a'
  (/=) (ThatOne a) (ThatOne a') = a /= a'


-------------------------------------------------------------
-- case 7
data EitherOr a b = Hello a | Goodbye b

-- my solution
instance (Eq a, Eq b) => Eq (EitherOr a b) where
  (/=) (Hello _) (Goodbye _) = True
  (/=) (Goodbye _) (Hello _) = True
  (/=) (Hello a) (Hello a') = a /= a'
  (/=) (Goodbye a) (Goodbye a') = a /= a'
