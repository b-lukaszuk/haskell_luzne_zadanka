# Ch07

Choosen exercises (some were too easy, or not enough interesting) from Chapter 7 (rest of the exercises were solved 'in head')

---

# Table of contents

1. [Grab Bag](#grab-bag)
2. [Variety Pack](#variety-pack)
3. [Case Practice](#case-practice)
4. [Let's write code](#lets-write-code)

---

## Grab bag

[Go to: Table of contents](#table-of-contents)

Solutions are in the file: `anonymous.hs`

### Case a

Rewrite the f function in the where clause to lambda syntax

<pre>
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f n = n + 1
</pre>

### Case b

Rewrite the following to use anonymous lambda syntax

<pre>
addFive x y = (if x > y then y else x) + 5
</pre>

### Case c

Rewrite the following so that it doesn't use lambda syntax

<pre>
mfilp f = \x -> \y -> f y x
</pre>

## Variety Pack

[Go to: Table of contents](#table-of-contents)

Solutions are in the file: `varietyPack.hs`

### Case 1

Given the following declarations

<pre>
k (x, y) = x
k1 = k ((4-1), 10)
k2 = k ("three", (1 + 2))
k3 = k (3, True)
</pre>

a) What is the type of k?<br>
`k :: (a, b) -> a`<br>
<br>
b) What is the type of k2? Is it the same type as k1 or k3?<br>
`k2 :: Num a => a`<br>
Only the types of `k2` and `k3` are the same.<br>
Typing `3` into REPL gives broadest possible type, i.e. `Num`.<br>
Regarding `(-)` it requires two `Num` as arguments.<br>
So in both cases (k1 and k3) first elt of the tuple is `Num`<br>
On the other hand, the type of `k2` is `String` or `[Char]`<br>
<br>
Later comment:<br>
Here REPL shows `k1 :: Integer` and not `k1 :: Num` as I expexted (the same stands for k3).<br>
Reason: `Chapter 6.7 Type-defaulting typeclasses` ("Haskell. Programming from first principles", C. Allen, J. Moronuki, p. 183) says that `default Num Integer`<br>
<br>
c) Of k1, k2, k3, which will return the number 3 as the result?<br>
Both `k1` and `k3` will return the number 3 (`Num`) as the result.<br>

### Case 2

Fill in the definition of the following function:

<pre>
f :: (a, b, c) -> (d, e, f) -> ((a, d), (c, f))
f = undefined
</pre>

## Case Practice

[Go to: Table of contents](#table-of-contents)

Solutions are in the file: `casePractice.hs`

### Case 1

Rewrite to case of

<pre>
functionC x y = if (x > y) then x else y
</pre>

### Case 2

Rewrite to case of

<pre>
ifEvenAdd2 n = if even n then (n+2) else n
</pre>

### Case 3

Cover all the cases

<pre>
nums x = case compare x 0 of
 LT -> -1
 GT -> 1
</pre>

## Let's write code

[Go to: Table of contents](#table-of-contents)

Solutions are in the file: `letsWriteCode.hs`

### Case 1

The function returns the tens digit of an integral argument.

<pre>
tensDigit :: Integral a => a -> a
tensDigit x = d
    where xLast = x `div` 10
    d = xLast `mod` 10
</pre>

a) rewrite it using `divMod`<br>
b) Does the `divMod` version have the same type as the original version<br>
c) change it to `hunsD`, a function that returns hundreds digits instead of the tens.<br>

### Case 2

Implement the following function using:<br>
a) case expression<br>
b) using guards<br>

<pre>
foldBool :: a -> a -> Bool -> a
</pre>

here is pattern matching version to get you started:

<pre>
foldBool3 :: a -> a -> Bool -> a
foldBool3 x _ False = x
foldBool3 _ y True = y
</pre>

### Case 3

Fill in the definition.

<pre>
g :: (a -> b) -> (a, c) -> (b, c)
g = undefined
</pre>

### Case 5

Write a pointfree versions of the `roundTrip` function below.

<pre>
-- arith4.hs
module Arith4 where

-- id is a build-in function from Prelude (BL)
-- id :: a -> a
-- id x = x

roundTrip :: (Show a, Read a) => a -> a
roundTrip a = read (show a)

main = do
    print (roundTrip 4)
	print (id 4)
</pre>

### Case 6

Change the function `roundTrip` to `roundTrip :: (Show a, Read b) => a -> b` so that the expression `print (roundtrip 4)` works.
