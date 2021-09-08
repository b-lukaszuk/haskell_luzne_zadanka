module Person (gimmePerson) where

type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty | AgeTooLow | PersonInvalidUnknown String
  deriving (Eq, Show)

isPersonOk :: Either PersonInvalid Person -> Bool
isPersonOk (Right _) = True
isPersonOk _ = False

getErrorMsg :: Either PersonInvalid Person -> String
getErrorMsg (Right _) = "Everything is ok."
getErrorMsg (Left NameEmpty) = "No name given."
getErrorMsg (Left AgeTooLow) = "Age too low."
getErrorMsg (Left (PersonInvalidUnknown msg)) = msg

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 = Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise =
      Left $ PersonInvalidUnknown $
      "Name was: " ++ show name ++
      " Age was: " ++ show age

getPerson :: Either PersonInvalid Person -> Person
getPerson (Right aPerson) = aPerson
getPerson _ = error "cannot return a person because none was created!"

gimmePerson :: IO ()
gimmePerson = do
  putStrLn $ "\nHello. I will construct a Person object"
  putStrLn $ "\nPlease enter the person name: "
  aName <- getLine
  putStrLn $ "\nPlease enter the person age: "
  anAge <- getLine
  putStrLn $ "\nThank You. Constructing a person..."
  let eitherPerson = (mkPerson aName (read anAge :: Integer))
  if isPersonOk eitherPerson
    then do
    putStrLn "Yay! Person created. Info:"
    putStrLn $ show $ getPerson eitherPerson
    else do
    putStrLn $ "Something went wrong. Here are the errors:"
    putStrLn $ getErrorMsg eitherPerson
    putStrLn $ "\nPlease re-run the program and correct your errors."
