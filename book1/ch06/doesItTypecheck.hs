-- case 1
data Person = Person Bool deriving Show

printPerson :: Person -> IO ()
printPerson person = putStrLn (show person)

-- and now typing the below commands in REPL, will work:
-- printPerson (Person True)
-- printPerson (Person False)


-- case 2
data Mood = Blah | Woot deriving (Show, Eq)
settleDown x = if x == Woot then Blah else x


-- case 3
-- here, everything should be OK without any changes of mine
type Subject = String
type Verb = String
type Object = String

data Sentence = Sentence Subject Verb Object deriving (Eq, Show)

s1 = Sentence "dogs" "drool"
s2 = Sentence "Julie" "loves" "dogs"
