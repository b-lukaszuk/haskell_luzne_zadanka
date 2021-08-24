# Ch11

Choosen exercises (some were too easy, or not enough interesting) from Chapter 11 (rest of the exercises were solved 'in head' or not at all). Some commands were slightly modified.

---

# Table of contents

1. [Vehicles](#vehicles)
2. [Logic Goats](#logic-goats)
3. [Programmers](#programmers)
4. [Binay Tree](#binary-tree)
4. [Binay Tree2](#binary-tree2)

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
allOSs = [ GnuPlusLinux , OpenBSD, , Mac , Windows]

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
