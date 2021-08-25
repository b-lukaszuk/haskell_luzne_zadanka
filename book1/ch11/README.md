# Ch11

Choosen exercises (some were too easy, or not enough interesting) from Chapter 11 (rest of the exercises were solved 'in head' or not at all). Some commands were slightly modified.

---

# Table of contents

1. [Vehicles](#vehicles)
2. [Logic Goats](#logic-goats)
3. [Programmers](#programmers)
4. [Binay Tree](#binary-tree)
5. [Binay Tree2](#binary-tree2)
6. [Binay Tree3](#binary-tree3)
7. [Ciphers](#ciphers)
8. [As Patterns](#as-patterns)
9. [Language Exercises](#language-exercises)
10. [Phone Exercises](#phone-exercises)

---

## Vehicles

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `Vehicles.hs`

Given that:

<pre>
data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYOurChancesUnited deriving (Eq, Show)

data Price = Price Integer deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Plane Airline deriving (Eq, Show)

myCar = Car Mini (Price 14000)
urCar = Car Mazda (Price 20000)
clownCar = Car Tata (Price 7000)
doge = Plane PapuAir
</pre>

### Case 2

Define the following functions:

<pre>
isCar :: Vehicle -> Bool
isCar = undefined

isPlane :: Vehicle -> Bool
isPlane = undefined

areCars :: [Vehicle] -> [Bool]
areCars = undefined
</pre>

### Case 3

Write a function to tell us the manufacturer of a piece of data:

<pre>
getManu :: Vehicle -> Manufacturer
getManu = undefined
</pre>

### Case 5

Add the size of the plane as an argument to the Plane constructor. Add the appropriate datatypes in the appropriate places.

## Logic Goats

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `LogicGoats.hs`

Given that:

<pre>
newtype Goats = Goats Int deriving Show

class TooMany a where
	tooMany :: a -> Bool

instance TooMany Int where
	tooMany n = n > 42

instance TooMany Goats where
	tooMany (Goats n) = n > 43
</pre>

### Case 1

Reuse TooMany typeclass, write an instance of it for the type (Int, String). Add pragma `FlexibleInstances`

### Case 2

Make another TooMany instance for (Int, Int). Sum the values together and then compare (like comparing a count of goats from two different fields)

### Case 3

Make another TooMany instance for (Num a, TooMany a) => (a, a). It can mean whatever you want (like summing the two numbers together).

## Programmers

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `Programmers.hs`

Given that:

<pre>
data OS = GnuPlusLinux | OpenBSD | Mac | Windows deriving (Eq, Show)

data ProgLang = Haskell | Agda | Idris | PureScript deriving (Eq, Show)

data Programmer = Programmer { os :: OS , lang :: ProgLang } deriving (Eq, Show)
</pre>

Write a function that generates all possible valeus of Programmer. Use the code snippet below:

<pre>
allOSs :: [OS]
allOSs = [GnuPlusLinux , OpenBSD, , Mac , Windows]

allProgLangs:: [ProgLang]
allProgLangs = [Haskell, Agda, Idris, PureScript]

allProgrammers :: [Programmer]
allProgrammers = undefined
</pre>

The `length` of allProgrammers should be equal to `length allOSs * length allProgLangs`

## Binary Tree

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `BinaryTree.hs`

Given that:

<pre>
data BinaryTree a = Leaf | Node (BinaryTree a) a (BinaryTree a) deriving (Eq, Ord, Show)

testTree' :: BinaryTree Integer
testTree' = Node (Node Leaf 3 Leaf) 1 (Node Leaf 4 Leaf)

mapExpected = Node (Node Leaf 4 Leaf) 2 (Node Leaf 5 Leaf)

-- acceptance test for mapTree
mapOkay = if mapTree (+1) testTree' == mapExpected
	then print "yup okay!"
	else error "test failed!"
</pre>

Write a function `mapTree` with the following type signature:

<pre>
mapTree :: (a -> b) -> BinaryTree a -> BinaryTree b
mapTree _ Leaf = Leaf
mapTree f (Node left a right) = Node undefined undefined undefined
</pre>

## Binary Tree2

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `BinaryTree2.hs`

Write a function to convert `BinaryTree` to list.

Here is some helpful scafollding

<pre>
preorder :: BinaryTree a -> [a]
preorder = undefined

inorder :: BinaryTree a -> [a]
inorder = undefined

postorder :: BinaryTree a -> [a]
postorder = undefined

testTree :: BinaryTree Integer
testTree = Node (Node Leaf 1 Leaf) 2 (Node Leaf 3 Leaf)

testPreorder :: IO ()
testPreorder = if preorder testTree == [2, 1, 3]
	then putStrLn "Preorder fine!"
	else putStrLn "Bad news bears."

testInorder :: IO ()
testInorder = if inorder testTree == [1, 2, 3]
	then putStrLn "Inorder fine!"
	else putStrLn "Bad news bears."

testPostorder :: IO ()
testPostorder = if postorder testTree == [1, 3, 2]
	then putStrLn "Postorder fine!"
	else putStrLn "postorder failed check"

main :: IO ()
main = do
	testPreorder
	testInorder
	testPostorder
</pre>

## Binary Tree3

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `BinaryTree3.hs`

Write foldr for BinaryTree. Below you will find the function's signature.

<pre>
-- any traversal order is fine
foldTree :: (a -> b -> b) -> b -> BinaryTree a -> b
</pre>

## Ciphers

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `Ciphers.hs`

Modify your Caesar cipher (Chapter 09). And Build Vigenere cipher.

> So, for example, if you want to encode the message “meet at
> dawn,” the first step is to pick a keyword that will determine which
> Caesar cipher to use. We’ll use the keyword “ALLY” here. You repeat
> the keyword for as many characters as there are in your original
> message:
> MEET AT DAWN
> ALLY AL LYAL
> Now the number of rightward shifts to make to encode each
> character is set by the character of the keyword that lines up with it.
> The ’A’ means a shift of 0, so the initial M will remain M. But the ’L’
> for our second character sets a rightward shift of 11, so ’E’ becomes
> ’P’. And so on, so “meet at dawn” encoded with the keyword “ALLY”
> becomes “MPPR AE OYWY.”

## As Patterns

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `AsPatterns.hs`

Write the following functions using as-patterns:

### Case 1

<pre>
isSubseqOf :: (Eq a) => [a] -> [a] -> Bool

-- usage:

Prelude>
 isSubseqOf "blah" "blahwoot"
True
Prelude>
 isSubseqOf "blah" "wootblah"
True
Prelude>
 isSubseqOf "blah" "wboloath"
True
Prelude>
 isSubseqOf "blah" "wootbla"
False
Prelude>
 isSubseqOf "blah" "halbwoot"
False
Prelude>
 isSubseqOf "blah" "blawhoot"
True
</pre>

The sub-sequence has to be in the original order!

### Case 2

<pre>
capitalizeWords :: String -> [(String, String)]

-- usage:

Prelude> capitalizeWords "hello world"
[("hello", "Hello"), ("world", "World")]
</pre>

## Language Exercises

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `LanguageExercises.hs`

Write the following functions

### Case 1

<pre>
capitalizeWord :: String -> String
capitalizeWord = undefined

-- usage:

Prelude> capitalizeWord "Chortle"
"Chortle"
Prelude> capitalizeWord "chortle"
"Chortle
</pre>

### Case 2

<pre>
capitalizeParagraph :: String -> String
capitalizeParagraph = undefined

-- usage:

Prelude> let s = "blah. woot ha."
Prelude> capitalizeParagraph s
"Blah. Woot ha."
</pre>

Hints: Recognize a new sentence by checking for periods. Reuse the `capitalizeWord` function from above.

## Phone Exercises

[Go to: Table of contents](#table-of-contents)

The solutions are in the file `PhoneExercises.hs`

Wrtie functions dealing with the old fashioned phone inputs (used for writing SMS-es).
