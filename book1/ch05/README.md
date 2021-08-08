# Ch05

Choosen exercises (some were too easy, or not enough interesting) from Chapter 4 (rest of the exercises were solved 'in head')

---

# Table of contents

1. [Write a type signature](#write-a-type-signature)
2. [Given a type, write a the function](#given-a-type-write-the-function)

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
