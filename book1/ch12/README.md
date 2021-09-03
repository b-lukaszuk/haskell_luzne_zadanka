# Ch12

Choosen exercises (some were too easy, or not enough interesting) from Chapter 12 (rest of the exercises were solved 'in head' or not at all). Some commands were slightly modified.

---

# Table of contents

1. [String Processing](#string-processing)
2. [Validate the Word](#validate-the-word)
3. [It's only normal](#its-only-normal)
4. [Small library for Maybe](#small-library-for-maybe)
5. [Small library for Either](#small-library-for-either)
6. [Unfolds](#unfolds)
7. [Binary Trees](#binary-trees)

---

## String Processing

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `StringProcessing.hs`

### Case 1

Write a recursive function `replaceThe`

Below helpful scafollding:

<pre>
-- example GHCi session
-- above the functions

-- >>> notThe "the"
-- Nothing

-- >>> notThe "blahtheblah"
-- Just "blahtheblah"

-- >>> notThe "woot"
-- Just "woot"

notThe :: String -> Maybe String
notThe = undefined


-- >>> replaceThe "the cow loves us"
-- "a cow loves us"

replaceThe :: String -> String
replaceThe = undefined
</pre>

### Case 2

Write a recursive function `countTheBeforeVowel` that counts the occurences of the word `the` but only if it precedes a word that starts with a vowel.

Scafollding:

<pre>
-- >>> countTheBeforeVowel "the cow"
-- 0
-- >>> countTheBeforeVowel "the evil cow"
-- 1

countTheBeforeVowel :: String -> Integer -- why not Int (it is returned by length)
countTheBeforeVowel = undefined
</pre>

### Case 3

Return the number of letters that are vowels in the word.

Scafollding:

<pre>
-- >>> countVowels "the cow"
-- 2
-- >>> countVowels "Mikolajczak"
-- 4

countVowels :: String -> Integer
countVowels = undefined
</pre>

## Validate the Word

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `ValidateTheWord.hs`

Write a function that counts vowels and cononants in a string. If the number of vowels exceeds the number of consonants, return Nothing.
In general vowels rarely exceed the number of consonants so when they do it may indicate invalid input.

Scafollding:

<pre>
newtype Word' = Word' String deriving (Eq, Show)

vowels = "aeiou"

mkWord :: String -> Maybe Word'
mkWord = undefined
</pre>

## It's only normal

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `ItsOnlyNormal.hs`

Write a small program converting (both ways) between natural numbers (0 and positive Integers) and Integers.

Scaffolding:

<pre>
-- As natural as any
-- competitive bodybuilder
data Nat = Zero | Succ Nat deriving (Eq, Show)

-- >>> natToInteger Zero
-- 0
-- >>> natToInteger (Succ Zero)
-- 1
-- >>> natToInteger (Succ (Succ Zero))
-- 2

natToInteger :: Nat -> Integer
natToInteger = undefined

-- >>> integerToNat 0
-- Just Zero
-- >>> integerToNat 1
-- Just (Succ Zero)
-- >>> integerToNat 2
-- Just (Succ (Succ Zero))
-- >>> integerToNat (-1)
-- Nothing

integerToNat :: Integer -> Maybe Nat
integerToNat = undefined
</pre>

## Small library for Maybe

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `smallLibraryForMaybe.hs`

Write the following functions.

### Case 1

Checks for `Maybe`

<pre>
-- >>> isJust (Just 1)
-- True
-- >>> isJust Nothing
-- False
isJust :: Maybe a -> Bool

-- >>> isNothing (Just 1)
-- False
-- >>> isNothing Nothing
-- True
isNothing :: Maybe a -> Bool
</pre>

### Case 2

Write `Maybe` catamorphism to turn `Maybe` value into anything else.

<pre>
-- >>> mayybee 0 (+1) Nothing
-- 0
-- >>> mayybee 0 (+1) (Just 1)
-- 2
mayybee :: b -> (a -> b) -> Maybe a -> b
</pre>

### Case 3

Fallback value for `Maybe`.

<pre>
-- >>> fromMaybe 0 Nothing
-- 0
-- >>> fromMaybe 0 (Just 1)
-- 1

fromMaybe :: a -> Maybe a -> a
-- Try writing it in terms
-- of the maybe catamorphism
</pre>

### Case 4

Conversion between `Maybe` and list.

<pre>
-- >>> listToMaybe [1, 2, 3]
-- Just 1
-- >>> listToMaybe []
-- Nothing
listToMaybe :: [a] -> Maybe a

-- >>> maybeToList (Just 1)
-- [1]
-- >>> maybeToList Nothing
-- []
maybeToList :: Maybe a -> [a]
</pre>

### Case 5

Drop `Nothing` from list.

<pre>
-- >>> catMaybes [Just 1, Nothing, Just 2]
-- [1, 2]
-- >>> let xs = take 3 $ repeat Nothing
-- >>> catMaybes xs
-- []
catMaybes :: [Maybe a] -> [a]
</pre>

### Case 6

Flip `Maybe` according to the example:

<pre>
-- >>> flipMaybe [Just 1, Just 2, Just 3]
-- Just [1, 2, 3]
-- >>> flipMaybe [Just 1, Nothing, Just 3]
-- Nothing
flipMaybe :: [Maybe a] -> Maybe [a]
</pre>

## Small library for Either

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `SmallLibraryForEither.hs`

Write the following functions for `Either`

### Case 1

Try to arrive at a solution that uses `foldr`.

<pre>
lefts' :: [Either a b] -> [a]
</pre>

### Case 2

Again. Try to use `foldr`

<pre>
rights' :: [Either a b] -> [b]
</pre>

### Case 3

<pre>
partitionEithers' :: [Either a b] -> ([a], [b])
</pre>

### Case 4

<pre>
eitherMaybe' :: (b -> c) -> Either a b -> Maybe c
</pre>

### Case 5

General catamorphism for `Either` values:

<pre>
either' :: (a -> c) -> (b -> c) -> Either a b -> c
</pre>

### Case 6

Same as before, but use the `either'` function you just wrote.

<pre>
eitherMaybe'' :: (b -> c) -> Either a b -> Maybe c
</pre>

## Unfolds

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `Unfolds.hs`

### Case 1

Write the function `myIterate` using direct recursion.

<pre>
myIterate :: (a -> a) -> a -> [a]
myIterate = undefined

-- example
-- we must use take because the list is infinite
Prelude> take 10 $ myIterate (+1) 0
[0,1,2,3,4,5,6,7,8,9]
</pre>

### Case 2

Write the function `myUnfoldr` using direct recursion.

<pre>
myUnfoldr :: (b -> Maybe (a, b)) -> b -> [a]
myUnfoldr = undefined

-- example
-- we must use take because the list is infinite
Prelude> take 10 $ myUnfoldr (\b -> Just (b, b+1)) 0
[0,1,2,3,4,5,6,7,8,9]
</pre>

### Case 3

Rewrite `myIterate` into `betterIterate` using `myUnfoldr`

<pre>
betterIterate :: (a -> a) -> a -> [a]
betterIterate f x = myUnfoldr ...?
</pre>

## Binary Trees

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `BinaryTree.hs`

Given the datatype:

<pre>
data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Ord, Show)
</pre>

### Case 1

Write `unfold` for `BinaryTree`

<pre>
unfold :: (a -> Maybe (a,b,a)) -> a -> BinaryTree b
unfold = undefined
</pre>

### Case 2

Make a tree builder using the `unfold` function you wrote before.

<pre>
treeBuild :: Integer -> BinaryTree Integer
treeBuild n = undefined

-- example
Prelude> treeBuild 0
Leaf
Prelude> treeBuild 1
Node Leaf 0 Leaf
Prelude> treeBuild 2
Node (Node Leaf 1 Leaf)
     0
     (Node Leaf 1 Leaf)
Prelude> treeBuild 3
Node (Node (Node Leaf 2 Leaf)
           1
		   (Node Leaf 2 Leaf))
     0
	 (Node (Node Leaf 2 Leaf)
	       1
		   (Node Leaf 2 Leaf))
</pre>
