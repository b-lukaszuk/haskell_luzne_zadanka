Some of the tasks from Chapter 3 of [Real World Haskell](http://book.realworldhaskell.org/read/) by Bryan O'Sullivan, Don Stewart, and John Goerzen

---

# Table of contents

1. [Task 1](#task-1)
2. [Task 2](#task-2)
3. [Task 3](#task-3)
4. [Task 4](#task-4)

---

# Task 1

[Go to: Table of contents](#table-of-contents)

> Write your own “safe” definitions of the standard partial list functions, but make sure that yours never fail. As a hint, you might want to consider using the following types.

<pre>
safeHead :: [a] -> Maybe a
safeTail :: [a] -> Maybe [a]
safeLast :: [a] -> Maybe a
safeInit :: [a] -> Maybe [a]
</pre>

# Task 2

[Go to: Table of contents](#table-of-contents)

> Write a function splitWith that acts similarly to words, but takes a predicate and a list of any type, and splits its input list on every element for which the predicate returns False

<pre>
splitWith :: (a -> Bool) -> [a] -> [[a]]
</pre>

# Task 3

[Go to: Table of contents](#table-of-contents)

> Using the command framework from the section called “A simple command line framework”, write a program that prints the first word of each line of its input.

Reminder. A simple command line framework:

<pre>
-- file: ch04/InteractWith.hs
-- Save this in a source file, e.g. Interact.hs

import System.Environment (getArgs)

interactWith function inputFile outputFile = do
  input <- readFile inputFile
  writeFile outputFile (function input)

main = mainWith myFunction
  where mainWith function = do
          args <- getArgs
          case args of
            [input,output] -> interactWith function input output
            _ -> putStrLn "error: exactly two arguments needed"

        -- replace "id" with the name of our function below
        myFunction = id
</pre>

Here I discarded it and used a framework from: [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/input-and-output#files-and-streams).

Used framework:

<pre>
main = do
    line <- getLine
    if null line
        then return ()
        else do
            putStrLn $ reverseWords line
            main

reverseWords :: String -> String
reverseWords = unwords . map reverse . words
</pre>

Usage:

```bash
cd tasks_1_4
runhaskell task3.hs
Hello. Type your text and press Enter and I'll print the first word
Enter empty line to end the program
> ala ma kota
ala
> tom i jerry
tom
>
That's all. Goodbye!
```

# Task 4

[Go to: Table of contents](#table-of-contents)

> Write a program that transposes the text in a file. For instance, it should convert "hello\nworld\n" to "hw\neo\nlr\nll\nod\n"
