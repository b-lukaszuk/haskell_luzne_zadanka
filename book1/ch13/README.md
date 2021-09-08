# Ch13

Choosen exercises (some were too easy, or not enough interesting) from Chapter 13 (rest of the exercises were solved 'in head' or not at all). Some commands were slightly modified.

---

# Table of contents

1. [Modify the hangman game](#modify-the-hangman-game)
2. [Ciphers](#ciphers)
3. [Palindrome](#palindrome)
4. [Better palindrome detector](#better-palindrome-detector)
5. [Person](#person)

---

## Modify the hangman game

[Go to: Table of contents](#table-of-contents)

The solutions are in the `Main.hs` file in the `hangman/src`

Correct the following flaws in game logic:

- you get upto 7 guesses but words may be 9 characters long
- the game ends after 7 guesses (no matter if they were correct or not)
- when the 7th guess solves the puzzle you still lose

## Ciphers

[Go to: Table of contents](#table-of-contents)

The solutions are in the `ciphers/` directory

Modify your Caesar and/or Vigenere ciphers to work with user input.

## Palindrome

[Go to: Table of contents](#table-of-contents)

The solutions are in the `Palindrome.hs` file

Modify the code below to exit successfully after a False result (right now it will run forever)

<pre>
import Control.Monad

palindrome :: IO()
palindrome = forever $ do
	line1 <- getLine
	case (line1 == reverse line1) of
	True -> putStrLn "It's a palindrome!"
	False -> putStrLn "Nope!"
</pre>

## Better palindrome detector

[Go to: Table of contents](#table-of-contents)

The solutions are in the `BetterPalindromeDetector.hs` file

Modify the code above so that it correctly recognizes the sentence "Madam I'm Adam" as palindrome.

## Person

[Go to: Table of contents](#table-of-contents)

The solutions are in the `Person.hs` file

Given the follwing code:

<pre>
type Name = String
type Age = Integer

data Person = Person Name Age deriving Show

data PersonInvalid = NameEmpty | AgeTooLow | PersonInvalidUnknown String deriving (Eq, Show)

mkPerson :: Name -> Age -> Either PersonInvalid Person
mkPerson name age
  | name /= "" && age > 0 =
      Right $ Person name age
  | name == "" = Left NameEmpty
  | not (age > 0) = Left AgeTooLow
  | otherwise =
      Left $ PersonInvalidUnknown $
      "Name was: " ++ show name ++
      " Age was: " ++ show age
</pre>

write the following function **without** modifying the code above

<pre>
gimmePerson :: IO ()
gimmePerson = undefined
</pre>

It should:
- prompt the user for a name and age input
- construct a `Person` based on given data
- It should inform about successful `Person` construction printing "Yay!" and `Person`
- if it receive wrong value it should report the error (print it)
