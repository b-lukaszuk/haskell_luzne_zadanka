Some of the tasks from Chapter 3 of [Real World Haskell](http://book.realworldhaskell.org/read/) by Bryan O'Sullivan, Don Stewart, and John Goerzen

---

# Table of contents

1. [Task 1](#task-1)
2. [Task 2](#task-2)
3. [Task 3](#task-3)
4. [Task 4](#task-4)
5. [Task 5](#task-5)
6. [Task 6](#task-6)
7. [Task 7](#task-7)
8. [Task 8](#task-8)
9. [Task 9](#task-9)
10. [Task 10](#task-10)

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

# Task 5

[Go to: Table of contents](#table-of-contents)

> Use a fold (choosing the appropriate fold will make your code much simpler) to rewrite and improve upon the asInt function from the section called “Explicit recursion”

Reminder (C function)

<pre>
int as_int(char *str)
{
    int acc; /* accumulate the partial result */

    for (acc = 0; isdigit(*str); str++) {
	acc = acc * 10 + (*str - '0');
    }

    return acc;
}
</pre>

use:

<pre>
import Data.Char (digitToInt) -- we'll need ord shortly

asInt :: String -> Int
</pre>

Expected behavior:

<pre>
ghci> asInt_fold "101"
101
ghci> asInt_fold "-31337"
-31337
ghci> asInt_fold "1798"
1798

ghci> asInt_fold ""
0
ghci> asInt_fold "-"
0
ghci> asInt_fold "-3"
-3
ghci> asInt_fold "2.7"
*** Exception: Char.digitToInt: not a digit '.'
ghci> asInt_fold "31415926535897932384"
64616105916946374 -- not sure why it returns this output ?!
</pre>

# Task 6

[Go to: Table of contents](#table-of-contents)

> The asInt_fold function uses error, so its callers cannot handle errors. Rewrite it to fix this problem

Imprecise command, I will come up with something on my own, although it will not necessarily be what the authors had in mind.

# Task 7

[Go to: Table of contents](#table-of-contents)

> Write your own definition of concat using foldr.

# Task 8

[Go to: Table of contents](#table-of-contents)

> Write your own definition of the standard takeWhile function, first using explicit recursion, then foldr

# Task 9

[Go to: Table of contents](#table-of-contents)

> Write your own definition of the groupBy function

<pre>
groupBy :: (a -> a -> Bool) -> [a] -> [[a]]
</pre>

# Task 10

[Go to: Table of contents](#table-of-contents)

Write the foloowing Prelude functions using `foldl'` or `foldr`

+ `any`
+ `cycle`
+ `words`
+ `unlines`
