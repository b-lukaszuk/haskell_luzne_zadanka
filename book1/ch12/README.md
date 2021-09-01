# Ch12

Choosen exercises (some were too easy, or not enough interesting) from Chapter 12 (rest of the exercises were solved 'in head' or not at all). Some commands were slightly modified.

---

# Table of contents

1. [String Processing](#string-processing)
2. [Validate the Word](#validate-the-word)
3. [It's only normal](#its-only-normal)

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

countTheBeforeVowel :: String -> Integer
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

The solutions are in the file `itsOnlyNormal.hs`

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
