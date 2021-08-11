# Ch05

Choosen exercises (some were too easy, or not enough interesting) from Chapter 5 (rest of the exercises were solved 'in head')

---

# Table of contents

1. [Write a type signature](#write-a-type-signature)
2. [Given a type, write a the function](#given-a-type-write-the-function)
3. [Fix it](#fix-it)
4. [Type Kwon Do](#type-kwon-do)

---


## Write a type signature

### Task 1

```haskell
functionH ::
functionH (x:_) = x
```

my answer:
```haskell
functionH :: [a] -> a
```

### Task 2

```haskell
functionC ::
functionC x y = if (x > y) then True else False
```

my answer:
```haskell
functionC :: (Ord a) => a -> a -> Bool
```

### Task 3

```haskell
functionS ::
functionS (x, y) = y
```

my answer:
```haskell
functionS :: (a, b) -> b
```

## Given a type write the function

### Task 6

```haskell
co :: (b -> c) -> (a -> b) -> a -> c
co = undefined
```

my answer
```haskell
co :: (b -> c) -> (a -> b) -> a -> c
co f g x = (f (g x))
-- or
co f g x = f $ g x
```

### Task 7

```haskell
a :: (a -> c) -> a -> a
a = undefined
```

my answer
```haskell
a :: (a -> c) -> a -> a
a f x = x
```

### Task 8

```haskell
a :: (a -> b) -> a -> b
a = undefined
```

my answer
```haskell
a :: (a -> b) -> a -> b
a f x = f x
```

## Fix it

### Task 1

```haskell
module sing where -- module names should start with [A..Z]

fstString :: [Char] ++ [Char] -- there should be '->' instead of '++'
fstString x = x ++ " in the rain"

sndString :: [Char] -> Char -- there should be '[Char]' instead of 'Char'
sndString x = x ++ " over the rainbow"

-- missing type declaration for the function
-- like: 'sing :: [Char]'
sing = if (x > y) then fstString x or sndString y -- not 'or' but 'then'
where x = "Singin"
	  x = "Somewhere" -- should be: 'y = "Somewhere"'
```

### Task 3

```haskell
-- arith3broken.hs
module Arith3Broken where

main :: IO ()
Main = do -- should be 'main' not 'Main'
	print 1 + 2 -- should be 'print (1 + 2)
	putStrLn 10 -- should be 'putStrLn $ show 10'
	print (negate -1) -- should be (negate 1), now we have kind of double negation
	print ((+) 0 blah)
	where blah = negate 1
```

## Type Kwon Do

Manipulate terms in order to get the types to fit

Rozwiazania taskow w pliku: `main.hs` (for a change)

### Task 1

<pre>
f :: Int -> String
f = undefined

g :: String -> Char
g = undefined

h :: Int -> Char
h = ???
</pre>

### Task 2

<pre>
data A
data B
data C

q :: A -> B
q = undefined

w :: B -> C
w = undefined

e :: A -> C
e = ???
</pre>

### Task 3

<pre>
data X
data Y
data Z

xz :: X -> Z
xz = undefined

yz :: Y -> Z
yz = undefined

xform :: (X, Y) -> (Z, Z)
xform = ???
</pre>

### Task 4

<pre>
munge :: (x -> y)
      -> (y -> (w, z))
      -> x
      -> w
munge = ???
</pre>
