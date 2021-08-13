# Ch06

Choosen exercises (some were too easy, or not enough interesting) from Chapter 6 (rest of the exercises were solved 'in head')

---

# Table of contents

1. [Eq Instances](#eq-instances)
2. [Will they work](#will-they-work)
3. [Does it typecheck?](#does-it-typecheck)
4. [Type-Kwon-Do Two: Electric Typealoo](#type-kwon-do-two)

---

## Eq Instances

[Go to: Table of contents](#table-of-contents)

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

## Will they work

[Go to: Table of contents](#table-of-contents)

if: Will those code snippets evaluate correctly in GHCi,
then: what will be the result?
else: what is wrong with them?

### Case 1

```haskell
max (length [1,2,3]) (length [8,9,10,11,12])
```

my answer: Yes, it will. Result `5 :: Int`

### Case 2

```haskell
compare (3 * 4) (3 * 5)
```

my answer: Yes, it will. Result `LT :: Ordering`

### Case 3

```haskell
compare "Julie" True
```

my answer: No, it won't. Args need to be of the same type, so `String -> String` or `Bool -> Bool`

### Case 4

```haskell
(5 + 3) > (3 + 6)
```

my answer: Yes, it will. Result `False :: Bool`

## Does it typecheck?

[Go to: Table of contents](#table-of-contents)

Dzialajace programy w pliku `doesItTypecheck.hs`

### Case 1

<pre>
data Person = Person Bool

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)
</pre>

my answer:

It will fail. The `Person` has no instance of `Show`.
I used `deriving` to fix that. Now it works.

### Case 2

<pre>
data Mood = Blah | Woot deriving Show
settleDown x = if x == Woot then Blah else x
</pre>

my answer:

It will fail. The `Mood` has no instance of `Eq`.
I used `deriving` to fix that. Now it works.

### Case 3

If you were able to get settleDown to typecheck:<br>
a) What values are acceptable inputs to that function?<br>
my answer: only `Mood` type (so: `Blah` and `Woot`)<br>
b) What will happen if you try to run settleDown 9? Why?<br>
my answer: I will get an error, because I cannot compare `9 :: Num` with `Woot` (see answer above)<br>
c) What will happen if you try to run Blah > Woot? Why?<br>
my answer: I will get an error, because originally it only had `Show` derived, and I added `Eq`, but `Ord` instance is still missing<br>

### Case 4

<pre>
type Subject = String
type Verb = String
type Object = String

data Sentence =
	Sentence Subject Verb Object
	deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"
</pre>

my answer:<br>
It will compile. All three types (`Subject`, `Verb`, and `Object`) are synonymes of `String` (so they have string representation).<br>
`s1` is incompletely applied sentence (it still requires `Object`, but it's OK, like that).<br>
`s2` is a completely applied sentence.<br>
`Sentence` got instance of `Show` derived (so, it should be OK).

## Type Kwon Do Two

[Go to: Table of contents](#table-of-contents)

Electric Typealoo

Similar ruls as before (previous chapter). Derive the implementation from the type information.

### Case 1

<pre>
chk :: Eq b => (a -> b) -> a -> b -> Bool
chk = ??
</pre>

### Case 2

<pre>
-- Hint: use some arithmetic operation to
-- combine values of type 'b'. Pick one
arith :: Num b => (a -> b) -> Integer -> a -> b
arith = ??
</pre>
