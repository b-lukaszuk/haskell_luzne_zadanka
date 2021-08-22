module Wehicles where

-- necessary data (type declarations)
data Manufacturer = Mini | Mazda | Tata deriving (Eq, Show)

data Airline = PapuAir | CatapultsR'Us | TakeYOurChancesUnited deriving (Eq, Show)

data Price = Price Integer deriving (Eq, Show)

data Size = Small | Medium | Big deriving (Eq, Show)

data Vehicle = Car Manufacturer Price | Plane Airline Size deriving (Eq, Show)

-- type instances
myCar :: Vehicle
myCar = Car Mini (Price 14000)

urCar :: Vehicle
urCar = Car Mazda (Price 20000)

clownCar :: Vehicle
clownCar = Car Tata (Price 7000)

doge :: Vehicle
doge = Plane PapuAir Medium


-- case 2
isCar :: Vehicle -> Bool
isCar (Car _ _) = True
isCar _ = False

isPlane :: Vehicle -> Bool
isPlane (Plane _ _) = True
isPlane _ = False

areCars :: [Vehicle] -> [Bool]
areCars vehicles = map isCar vehicles


-- case 3
-- I added Maybe type because Plane does not have a manufacturer
getManu :: Vehicle -> Maybe Manufacturer
getManu (Car man _) = Just man
getManu _ = Nothing
