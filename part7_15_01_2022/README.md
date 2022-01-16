---

# Table of contents

1. [Info](#info)
2. [Task 1](#task-1)
3. [Task 2](#task-2)
4. [Task 3](#task-3)

---

# Info

Tasks from [Rosetta Code. Category: Programming Tasks](https://rosettacode.org/wiki/Category:Programming_Tasks)

# Task 1

[Go to: Table of contents](#table-of-contents)

Write [Akermann function](https://rosettacode.org/wiki/Ackermann_function)

## Description

The Ackermann function is usually defined as follows:

<pre>
A(m, n) = n + 1, if m = 0
A(m, n) = A(m-1, 1), if m > 0 and n = 0
A(m, n) = A(m-1, A(m, n-1)), if m > 0 and n > 0
</pre>

Write a function which returns the value of A(m, n). Arbitrary precision is preferred (since the function grows so quickly), but not required.

## Warning

**It may feeze the computer (or rather the program itself may freeze), e.g. A(4 ,2) is an integer of 19,729 decimal digits**

Here, the program uses safe inputs (A(3, 0) = 5 and A(3, 2) = 29).

Before evoking the functions with some numbers, check for safety, e.g. with [this wikipedia page](https://en.wikipedia.org/wiki/Ackermann_function#Table_of_values).

## Compilation

```bash
ghc -main-is Task1 Task1.hs
# otherwise ghc will create no executable (because no Main.hs here)
```

# Task 2

[Go to: Table of contents](#table-of-contents)

Write [Align columns](https://rosettacode.org/wiki/Align_columns):

## Description

Use the following text to test your programs:

<pre>
Given$a$text$file$of$many$lines,$where$fields$within$a$line$
are$delineated$by$a$single$'dollar'$character,$write$a$program
that$aligns$each$column$of$fields$by$ensuring$that$words$in$each$
column$are$separated$by$at$least$one$space.
Further,$allow$for$each$word$in$a$column$to$be$either$left$
justified,$right$justified,$or$center$justified$within$its$column.
</pre>

Note that:

1. The example input texts lines may, or may not, have trailing dollar characters.
2. All columns should share the same alignment.
3. Consecutive space characters produced adjacent to the end of lines are insignificant for the purposes of the task.
4. Output text will be viewed in a mono-spaced font on a plain text editor or basic terminal.
5. The minimum space between columns should be computed from the text and not hard-coded.
6. It is not a requirement to add separating characters between or around columns.

# Task 3

[Go to: Table of contents](#table-of-contents)

Write [Anagrams](https://rosettacode.org/wiki/Align_columns):

## Description

When two or more words are composed of the same characters, but in a different order, they are called [anagrams](https://en.wikipedia.org/wiki/Anagram).

Using the word list at   http://wiki.puzzlers.org/pub/wordlists/unixdict.txt,
find the sets of words that share the same characters that contain the most words in them.
