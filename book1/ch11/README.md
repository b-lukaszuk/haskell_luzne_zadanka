# Ch11

Choosen exercises (some were too easy, or not enough interesting) from Chapter 11 (rest of the exercises were solved 'in head' or not at all). Some commands were slightly modified.

---

# Table of contents

1. [Vehicles](#vehicles)

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
