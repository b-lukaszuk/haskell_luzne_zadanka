module Task1 where

import Data.List (intercalate)

data RhType = Pos | Neg deriving Eq
instance Show RhType where
  show Pos = "+"
  show Neg = "-"

data ABOType = A | B | AB | O deriving (Eq, Show)

data BloodType = BloodType ABOType RhType deriving (Eq)
instance Show BloodType where
  show (BloodType abo rh) = "Blood Type: " ++ (show abo) ++ (show rh)


data Name = Name {firstName :: String, familyName :: String}
instance Show Name where
  show aName = "Patient Name: " ++ familyName aName ++ ", " ++ firstName aName

data Sex = Male | Female deriving (Eq)
instance Show Sex where
  show Male = "Sex: Male"
  show Female = "Sex: Female"

data Patient = Patient {
  name :: Name
  , sex :: Sex
  , age :: Int
  , height :: Int
  , weight :: Int
  , bloodType :: BloodType
  }

p1 :: Patient
p1 = Patient {
  name=(Name{firstName="John", familyName="Smith"}),
  sex=Male,
  age=46,
  height=180,
  weight=80,
  bloodType=(BloodType A Pos)
  }

patientSummary :: Patient -> String
patientSummary p =
  let stars = take 14 $ repeat '*'
      lstOfData = [stars,
                   show (name p), show (sex p), "Age: " ++ show (age p),
                  "Height: " ++ show (height p) ++ " cm",
                  "Weight: " ++ show (weight p) ++ " kg",
                  show (bloodType p),
                  stars]
  in intercalate "\n" lstOfData

main :: IO ()
main = do
  putStrLn $ patientSummary p1
