# Ch14

Choosen exercises (some were too easy, or not enough interesting) from Chapter 14 (rest of the exercises were solved 'in head' or not at all). Some commands were slightly modified.

---

# Table of contents

1. [Mutliplication](#multiplication)
2. [Numbers into words](#numbers-into-words)
3. [Generators](#generators)
4. [Ciphers](#ciphers)

---

## Mutliplication

[Go to: Table of contents](#table-of-contents)

The solutions are in the folder `multiplication/`

Use `hspec` to test Your recursive multiplication function from chapter 08.

Files created by me:
- LICENSE
- multiplication.cabal
- Multiplication.hs

Then I typed:

```bash
stack init
stack build
stack ghci
```

It created additional files (they are ignored -> see .gitignore)

## Numbers into words

[Go to: Table of contents](#table-of-contents)

The solutions are in the folder `numbersIntoWords/`

Write some tests to validate the functions you wrote in exercise `Numbers into words` from chapter 08.

Fill in the test cases that print question marks.

<pre>
module WordNumberTest where

import Test.Hspec
import WordNumber (digitToWord, digits, wordNumber)

main :: IO ()
main = hspec $ do
    describe "digitToWord" $ do
        it "returns zero for 0" $ do
            digitToWord 0 `shouldBe` "zero"
        it "returns one for 1" $ do
            print "???"
    describe "digits" $ do
        it "returns [1] for 1" $ do
            digits 1 `shouldBe` [1]
        it "returns [1, 0, 0] for 100" $ do
            print "???"
    describe "wordNumber" $ do
        it "one-zero-zero given 100" $ do
        wordNumber 100
            `shouldBe` "one-zero-zero"
        it "nine-zero-zero-one for 9001" $ do
            print "???"
</pre>

### Additional info

Files created by me:
- LICENSE
- wordNumberTest.cabal
- WordNumber.hs (a copy of my solution of the task from ch08)
- WordNumberTest.hs (a copy of the scaffolding from this task)

Then I typed:

```bash
stack init
stack build
stack ghci
```

It created additional files (they are ignored -> see .gitignore)

## Generators

[Go to: Table of contents](#table-of-contents)

The solutions are in the folder `generators/`

Make a Gen random generator for the following datatypes.

### Case 1

Equal probabilities for each.

<pre>
data Fool = Fulse | Frue deriving (Eq, Show)
</pre>

### Case 2

2/3s chance of `Fulse`, 1/3 chance of `Frue`

<pre>
data Fool = Fulse | Frue deriving (Eq, Show)
</pre>

### Additional info

Files created by me:
- LICENSE
- generators.cabal
- Case1.hs
- Case2.hs
- Test.hs

Then I typed:

```bash
stack init
stack build
stack ghci
```

## Ciphers

[Go to: Table of contents](#table-of-contents)

The solutions are in the folder `ciphers/`

Create `QuickCheck` properties that verify your Caesar (Ch09) and/or Vigenere (Ch11) ciphers return the same data after encoding and decoding a string.
