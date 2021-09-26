# Ch15

Choosen exercises (some were too easy, or not enough interesting) from Chapter 15 (rest of the exercises were solved 'in head' or not at all). Some commands were slightly modified.

---

# Table of contents

1. [Optional Monoid](#optional-monoid)
2. [Refactoring with mconcat](#refactoring-with-mconcat)
3. [Maybe Another Monoid](#maybe-another-monoid)
4. [Semigroup Exercises](#semigroup-exercises)
5. [Monoid Exercises](#monoid-exercises)

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

## Semigroup Exercises

[Go to: Table of contents](#table-of-contents)

The solutions are in the folder `semigroupExercises/`

Given a datatype, implement the `Semigroup` instance.
Add type constraints where needed.
The `<>` means `mappend` from the `Semigroup` typeclass

### Case 1

<pre>
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
	_ <> _ = undefined

instance Arbitrary Trivial where
	arbitrary = return Trivial

semigroupAssoc :: (Eq m, Semigroup m) => m -> m -> m -> Bool
semigroupAssoc a b c = (a <> (b <> c)) == ((a <> b) <> c)

type TrivAssoc = Trivial -> Trivial -> Trivial -> Bool

main :: IO ()
main =
	quickCheck (semigroupAssoc :: TrivAssoc)
</pre>

### Case 2

<pre>
newtype Identity a = Identity a
</pre>


### Case 3

Hint: Ask for another Semigroup instance.

<pre>
 data Two a b = Two a b
</pre>

### Case 4

<pre>
data Three a b c = Three a b c
</pre>

### Case 5

<pre>
data Four a b c d = Four a b c d
</pre>

### Case 6

<pre>
newtype BoolConj = BoolConj Bool
</pre>

What it should do:

<pre>
Prelude> (BoolConj True) <> (BoolConj True)
BoolConj True

Prelude> (BoolConj True) <> (BoolConj False)
BoolConj False
</pre>

### Case 7

<pre>
newtype BoolDisj = BoolDisj Bool
</pre>

What it should do:

<pre>
Prelude> (BoolDisj True) <> (BoolDisj True)
BoolDisj True

Prelude> (BoolDisj True) <> (BoolDisj False)
BoolDisj True
</pre>

### Case 8

<pre>
data Or a b = Fst a | Snd b
</pre>

What it should do:

<pre>
Prelude> Fst 1 <> Snd 2
Snd 2

Prelude> Fst 1 <> Fst 2
Fst 2

Prelude> Snd 1 <> Fst 2
Snd 1

Prelude> Snd 1 <> Snd 2
Snd 1
</pre>

It has a "sticky" `Snd` where it'll hold onto the first `Snd` value when and if one is passed as an argument.

### Case 9

<pre>
newtype Combine a b = Combine { unCombine :: (a -> b) }
</pre>

What it should do:

<pre>
Prelude> let f = Combine $ \n -> Sum (n + 1)
Prelude> let g = Combine $ \n -> Sum (n - 1)
Prelude> unCombine (f <> g) $ 0
Sum {getSum = 0}

Prelude> unCombine (f <> g) $ 1
Sum {getSum = 2}

Prelude> unCombine (f <> f) $ 1
Sum {getSum = 4}

Prelude> unCombine (g <> f) $ 1
Sum {getSum = 2}
</pre>

> Hint: This function will eventually be applied to a single value
> of type a. But you’ll have multiple functions that can produce a
> value of type b. How do we combine multiple values so we have
> a single b? This one will probably be tricky! Remember that the
> type of the value inside of Combine is that of a function. The type
> of functions should already have an Arbitrary instance that you
> can reuse for testing this instance.

### Case 10

<pre>
newtype Comp a =
Comp { unComp :: (a -> a) }
</pre>

> Hint: We can do something that seems a little more specific and
> natural to functions now that the input and output types are the
> same.

### Case 11

<pre>
-- Look familiar?

data Validation a b = Failure a | Success b
	deriving (Eq, Show)

instance Semigroup a => Semigroup (Validation a b) where
	(<>) = undefined
</pre>

Given this code:

<pre>
main = do
	let failure :: String
		-> Validation String Int
	failure = Failure
	success :: Int
		-> Validation String Int
	success = Success
print $ success 1 <> failure "blah"
print $ failure "woot" <> failure "blah"
print $ success 1 <> success 2
print $ failure "woot" <> success 2
</pre>

You should get this output:

<pre>
Prelude> main
Success 1
Failure "wootblah"
Success 1
Success 2
</pre>

## Monoid exercises

[Go to: Table of contents](#table-of-contents)

The solutions are in the folder `monoidExercises/`

Given a datatype, implement the `Monoid` instance.
Add `Monoid` constraints to type variables where needed.

### Case 1

<pre>
data Trivial = Trivial deriving (Eq, Show)

instance Semigroup Trivial where
	(<>) = undefined

instance Monoid Trivial where
	mempty = undefined
	mappend = (<>)

type TrivAssoc =
	Trivial -> Trivial -> Trivial -> Bool

main :: IO ()
main = do
	let sa = semigroupAssoc
		mli = monoidLeftIdentity
		mlr = monoidRightIdentity
	quickCheck (sa :: TrivAssoc)
	quickCheck (mli :: Trivial -> Bool)
	quickCheck (mlr :: Trivial -> Bool)
</pre>

### Case 2

<pre>
newtype Identity a =
	Identity a deriving Show
</pre>

### Case 3

<pre>
data Two a b = Two a b deriving Show
</pre>

### Case 4

<pre>
newtype BoolConj =
	BoolConj Bool
</pre>

What it should do:

<pre>
Prelude> (BoolConj True) `mappend` mempty
BoolConj True

Prelude> mempty `mappend` (BoolConj False)
BoolConj False
</pre>

### Case 5

<pre>
newtype BoolDisj =
	BoolDisj Bool
</pre>

What it should do:

<pre>
Prelude> (BoolDisj True) `mappend` mempty
BoolDisj True

Prelude> mempty `mappend` (BoolDisj False)
BoolDisj False
</pre>

### Case 6

<pre>
newtype Combine a b =
	Combine { unCombine :: (a -> b) }
</pre>

What it should do:

<pre>
Prelude> let f = Combine $ \n -> Sum (n + 1)
Prelude> unCombine (mappend f mempty) $ 1
Sum {getSum = 2}
</pre>

### Case 7

<pre>
newtype Comp a =
	Comp (a -> a)
</pre>

Hint: We can do something that seems a little more specific and
natural to functions now that the input and output types are the
same.

### Case 8

<pre>
newtype Mem s a =
	Mem {
		runMem :: s -> (a,s)
	}

instance Monoid a => Monoid (Mem s a) where
	mempty = undefined
	mappend = undefined
</pre>

Given the following code:

<pre>
f' = Mem $ \s -> ("hi", s + 1)

main = do
	let rmzero = runMem mempty 0
		rmleft = runMem (f' <> mempty) 0
		rmright = runMem (mempty <> f') 0
	print $ rmleft
	print $ rmright
	print $ (rmzero :: (String, Int))
	print $ rmleft == runMem f' 0
	print $ rmright == runMem f' 0
</pre>

A correct `Monoid` for `Men` should, given the above code, get teh followin output

<pre>
Prelude> main
("hi",1)
("hi",1)
("",0)
True
True
</pre>
