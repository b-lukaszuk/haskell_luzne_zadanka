# Ch15

Choosen exercises (some were too easy, or not enough interesting) from Chapter 15 (rest of the exercises were solved 'in head' or not at all). Some commands were slightly modified.

---

# Table of contents

1. [Optional Monoid](#optional-monoid)
2. [Refactoring with mconcat](#refactoring-with-mconcat)
3. [Maybe Another Monoid](#maybe-another-monoid)

---

## Optional Monoid

[Go to: Table of contents](#table-of-contents)

The solutions are in the folder `optionalMonoid/`

Write the `Monoid` instance for our `Maybe` type renamed to `Optional`

<pre>
data Optional a = Nada | Only a deriving (Eq, Show)

instance Monoid a => Monoid (Optional a) where
mempty = undefined
mappend = undefined
</pre>

Expected output:

<pre>
Prelude> Only (Sum 1) `mappend` Only (Sum 1)
Only (Sum {getSum = 2})

Prelude> Only (Product 4) `mappend` Only (Product 2)
Only (Product {getProduct = 8})

Prelude> Only (Sum 1) `mappend` Nada
Only (Sum {getSum = 1})

Prelude> Only [1] `mappend` Nada
Only [1]

Prelude> Nada `mappend` Only (Sum 1)
Only (Sum {getSum = 1})
</pre>

## Refactoring with mconcat

[Go to: Table of contents](#table-of-contents)

The solutions are in the folder `refactoringWithMconcat/`

Given that:

<pre>
import Data.Monoid

type Verb = String
type Adjective = String
type Adverb = String
type Noun = String
type Exclamation = String

madlibbin' :: Exclamation -> Adverb -> Noun -> Adjective -> String
madlibbin' e adv noun adj =
e <> "! he said " <>
adv <> " as he jumped into his car " <>
noun <> " and drove off with his " <>
adj <> " wife."
</pre>

Refactor the code a bit using `mconcat`

<pre>
madlibbinBetter' :: Exclamation -> Adverb -> Noun -> Adjective -> String
madlibbinBetter' e adv noun adj = undefined
</pre>

## Maybe Another Monoid

[Go to: Table of contents](#table-of-contents)

The solutions are in the folder `maybeAnotherMonoid/`

Write a `Monoid` instance for a `Maybe` type which doesn't require a `Monoid` for the contents.

Write an `Arbitrary` instance for `First'`

Use scaffolding provided below

<pre>
newtype First' a = First' { getFirst' :: Optional a } deriving (Eq, Show)

instance Monoid (First' a) where
	mempty = undefined
	mappend = undefined

firstMappend :: First' a -> First' a -> First' a
firstMappend = mappend

type FirstMappend = First' String -> First' String -> First' String -> Bool
type FstId = First' String -> Bool

main :: IO ()
main = do
	quickCheck (monoidAssoc :: FirstMappend)
	quickCheck (monoidLeftIdentity :: FstId)
	quickCheck (monoidRightIdentity :: FstId)
</pre>

Exprcted output

<pre>
Prelude> First' (Only 1) `mappend` First' Nada
First' {getFirst' = Only 1}

Prelude> First' Nada `mappend` First' Nada
First' {getFirst' = Nada}

Prelude> First' Nada `mappend` First' (Only 2)
First' {getFirst' = Only 2}

Prelude> First' (Only 1) `mappend` First' (Only 2)
First' {getFirst' = Only 1}
</pre>
