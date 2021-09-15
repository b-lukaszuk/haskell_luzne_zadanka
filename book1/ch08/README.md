# Ch08

Choosen exercises (some were too easy, or not enough interesting) from Chapter 8 (rest of the exercises were solved 'in head')

---

# Table of contents

1. [Recursion](#Recursion)
2. [Fixing dividedBy](#fixing-dividedBy)
3. [McCarthy 91 function](#mccarthy-91-function)
4. [Numbers into words](#numbers-into-words)

---

## Recursion

[Go to: Table of contents](#table-of-contents)

Solutions are in the file: `recursion.hs`

### Case 2

Write a function that recursively sums all numbers from 1 to n.

Signature:

<pre>
(Eq a, Num a) => a -> a
</pre>

### Case 3

Write a function that multiplies two integral numbers using recursive summation.

Signature:

<pre>
(Integral a) => a -> a -> a
</pre>

## Fixing dividedBy

[Go to: Table of contents](#table-of-contents)

Solutions are in the file: `dividedBy.hs`

Previously we defined `dividedBy` as:

<pre>
dividedBy :: Integral a => a -> a -> (a, a)
dividedBy num denom = go num denom 0
    where go n d count
	      | n < d = (count, n)
		  | otherwise = go (n - d) d (count + 1)
</pre>

Rewrite it, so that it can handle division by 0, without throwing an error

## McCarthy 91 function

[Go to: Table of contents](#table-of-contents)

Solutions are in the file: `mccarthy91.hs`

Write recursive McCarthy 91 function based on formula:

<pre>
MC(n) = if n > 100 then n - 10 else MC(MC(n+11))
</pre>

use this to check its correctness:

<pre>
Prelude> map mc91 [95..110]
[91,91,91,91,91,91,91,92,93,94,95,96,97,98,99,100]
</pre>

## Numbers into words

[Go to: Table of contents](#table-of-contents)

Solutions are in the file: `wordNumber.hs`

Write a function that changes number into words separated by "-", like:

<pre>
Prelude> wordNumber 12324546
"one-two-three-two-four-five-four-six"
</pre>

You may want to use the following scaffolding:

<pre>
module WordNumber where

import Data.List (intersperse)

digitToWord :: Int -> String
digitToWord n = undefined

digits :: Int -> [Int]
digits n = undefined

wordNumber :: Int -> String
wordNumber n = undefined
</pre>
