# Ch06

Choosen exercises (some were too easy, or not enough interesting) from Chapter 6 (rest of the exercises were solved 'in head')

---

# Table of contents

1. [Eq Instances](#eq-instances)

---

## Eq Instances

[Back to Table of contents](#back-to-table-of-contents)

Write the Eq instances for the datatype provided
(checked for correctness, by typing ':set -Wall' in GHCi)

Solutions are in file `eqInstances.hs`

### Case 1

```haskell
-- it's not a typo, we're just being cute with the name
data TisAnInteger =
  TisAn Integer
```

### Case 2

```haskell
data TwoInteger =
  Two Integer Integer
```

### Case 3

```haskell
data StringOrInt =
  TisAnInt Int | TisAString String
```

### Case 4

```haskell
data Pair a = Pair a a
```

### Case 5

```haskell
data Tuple a b = Tuple a b
```

### Case 6

```haskell
data Which a = ThisOne a | ThatOne a
```

### Case 7

```haskell
data EitherOr a b = Hello a | Goodbye b
```
