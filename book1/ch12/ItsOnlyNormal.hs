module ItsOnlyNormal where

data Nat = Zero | Succ Nat deriving (Eq, Show)

countSucc :: Nat -> Integer -> Integer
countSucc Zero acc = acc
countSucc (Succ nat) acc = countSucc nat (acc + 1)

natToInteger :: Nat -> Integer
natToInteger nat = countSucc nat 0

-- not exhaustive pattern, but integerToNat will take care of n < 0
nOrdNat :: Integer -> Nat
nOrdNat 0 = Zero
nOrdNat n = Succ $ nOrdNat (n-1)

integerToNat :: Integer -> Maybe Nat
integerToNat n = if n < 0 then Nothing else Just $ nOrdNat n
