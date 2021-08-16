# Ch08

Choosen exercises (some were too easy, or not enough interesting) from Chapter 8 (rest of the exercises were solved 'in head')

---

# Table of contents

1. [Recursion](#Recursion)
2. [Fixing dividedBy](#fixing-dividedBy)

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
