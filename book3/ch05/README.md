Some of the tasks from Chapter 5 of [Real World Haskell](http://book.realworldhaskell.org/read/) by Bryan O'Sullivan, Don Stewart, and John Goerzen

---

# Table of contents

1. [Task 1](#task-1)

---

# Task 1

[Go to: Table of contents](#table-of-contents)

Given the datatype `Doc`:

<pre>
data Doc = Empty
         | Char Char
         | Text String
         | Line
         | Concat Doc Doc
         | Union Doc Doc
           deriving (Show,Eq)
</pre>

write a function `fill` with the following type signature:

<pre>
fill :: Int -> Doc -> Doc
</pre>

It should add spaces to a document until it is the given number of columns wide. If it is already wider than this value, it should add no spaces.
