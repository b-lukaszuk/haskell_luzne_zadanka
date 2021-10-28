Some of the tasks from Chapter 3 of [Real World Haskell](http://book.realworldhaskell.org/read/) by Bryan O'Sullivan, Don Stewart, and John Goerzen

# Task 1

> Write your own “safe” definitions of the standard partial list functions, but make sure that yours never fail. As a hint, you might want to consider using the following types.

<pre>
safeHead :: [a] -> Maybe a
safeTail :: [a] -> Maybe [a]
safeLast :: [a] -> Maybe a
safeInit :: [a] -> Maybe [a]
</pre>

# Task 2

> Write a function splitWith that acts similarly to words, but takes a predicate and a list of any type, and splits its input list on every element for which the predicate returns False

<pre>
splitWith :: (a -> Bool) -> [a] -> [[a]]
</pre>

# Task 3

> Using the command framework from the section called “A simple command line framework”, write a program that prints the first word of each line of its input.

A simple command line framework:

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

# Task 4

> Write a program that transposes the text in a file. For instance, it should convert "hello\nworld\n" to "hw\neo\nlr\nll\nod\n"
