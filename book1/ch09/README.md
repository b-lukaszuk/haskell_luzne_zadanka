# Ch09

Choosen exercises (some were too easy, or not enough interesting) from Chapter 9 (rest of the exercises were solved 'in head')

---

# Table of contents

1. [EnumFromTo](#enumfromto)
2. [The Fearful Symmetry](#the-fearful-symmetry)
3. [Square Cube](#square-cube)
4. [Filtering](#filtering)
5. [Zippig](#zipping)
6. [Ciphers](#ciphers)

---

## EnumFromTo

[Go to: Table of contents](#table-of-contents)

The solutions are in the file: `enumFromTo.hs`

Based on your knowledge of `Enum` (`:i Enum`) write your own `enumFromTo` definitions for the types provided. Do not use range syntax to do so. It should return the same results as if you did `[start..stop]` or `enumFromTo`.

<pre>
eftBool :: Bool -> Bool -> [Bool]
eftBool = undefined

eftOrd :: Ordering -> Ordering -> [Ordering]
eftOrd = undefined

eftInt :: Int -> Int -> [Int]
eftInt = undefined

eftChar :: Char -> Char -> [Char]
eftChar = undefined
</pre>

## The Fearful Symmetry

[Go to: Table of contents](#table-of-contents)

The solutions are in the file: `theFearfulSymmetry.hs`

### Case 1

Using `takeWhile` and `dropWhile` write a function `myWords` such that:

<pre>
Prelude> myWords "sheryl wants fun"
["sheryl", "wants", "fun"] -- separate sentence on spaces
</pre>

### Case 2

Do the same but the function should be named `myLines` and separate words on "\n", i.e. the newline character.

### Case 3

The two functions got a lot in common, write third function that takes a separator its argument.

## Square Cube

[Go to: Table of contents](#table-of-contents)

The solutions are in the file: `squareCube.hs`

Given the following:

<pre>
mySqr = [x^2 | x <- [1..5]]
myCube = [x^3 | x <- [1..5]]
</pre>

### Case 1

Write an expression that will make tuples of the outputs of mySqr and myCube

### Case 2

Alter the expression above so x < 50 and y < 50

### Case 3

How many tuples are in the list from the task above

## Filtering

[Go to: Table of contents](#table-of-contents)

The solutions are in the file: `filtering.hs`

### Case 1

Write a function that gives us all the multiples of 3 from range 1-30

### Case 2

Use function composition to find how many digits were returned by the function above

### Case 3

Write a function `myFilter` that removes all articles (like 'a', "the") from a sentence, e.g.

<pre>
Prelude> myFilter "The brown dog was a goof"
["brown", "dog", "was", "goof"]
</pre>

## Zipping

[Go to: Table of contents](#table-of-contents)

The solutions are in the file: `zipping.hs`

### Case 1

Write Your own version of zip

<pre>
zip :: [a] -> [b] -> [(a, b)]
zip = undefined
</pre>

### Case 2

Write Your own version of zipWith

<pre>
zipWith :: (a -> b -> c) -> [a] -> [b] -> [c]
zipWith = undefined
</pre>

### Case 3

Rewrite your `zip` in terms of the `zipWith` you wrote.

## Ciphers

[Go to: Table of contents](#table-of-contents)

The solutions are in the file: `ciphers.hs`

Write coder and decoder function for Cesar's cipher (right shift by 13)

Hints: you may want to use `Data.Char(chr, ord)` and `mod` function.
