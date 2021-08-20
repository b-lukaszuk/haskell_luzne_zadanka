# Ch10

Choosen exercises (some were too easy, or not enough interesting) from Chapter 10 (rest of the exercises were solved 'in head' or not at all)

---

# Table of contents

1. [Understanding Folds](#understanding-folds)

---

## Understanding folds

[Go to: Table of contents](#table-of-contents)

Fix the mistakes in the code snippets below (check in in REPL):

### Case 1

<pre>
foldr (++) ["woot", "WOOT", "woot"]
foldr (++) [] ["woot", "WOOT", "woot"] -- accumulator was missing
<pre>

### Case 2

<pre>
foldr max [] "fear is the little death"
foldr max ' ' "fear is the little death" -- incorrect accumulator, now it is 'Char' with the lowest possible value for 'Char' (meaningful character in ASCII)
</pre>

### Case 3

<pre>
foldr and True [False, True] -- 'and' takes a list (foldable) of Bools
foldr (&&) True [False, True] -- '&&' takes two 'Bool'-s
</pre>

### Case 4

<pre>
-- This one is more subtle than the previous. Can it ever return a different answer?
foldr (||) True [False, True] -- here '(||)' is the first evaluated argument (first pair),
-- so it will always give 'True' no matter the list (short circuiting of logical-or)
foldr (||) False [False, True] -- the accumulator should be 'False'
</pre>

### Case 5

<pre>
foldl ((++) . show) "" [1..5]
foldr ((++) . show) "" [1..5] -- this one works
-- I don't know why, after all show type: 'show :: Show a => a -> String' so it accepts only single argument, not a pair
</pre>

### Case 6

<pre>
foldr const 'a' [1..5] -- error: No instance for (Num Char) arising from the literal ‘1’
-- why would it like 1 to act as Char b
foldl const 'a' [1..5] -- this one works
foldr (\x b -> const b x) 'a' [1..5] -- this one works as well
-- I don't know why, both "const 'a' 2" and "const 2 'a'" work when typed in ghci
</pre>

### Case 7

<pre>
foldr const 0 "tacos"
foldl const 0 "tacos" -- this one works
-- I don't know why, both "const 0 't' and "const 't' 0" work when typed in ghci
-- the reason should be the same (or similar like in the case above)
</pre>

### Case 8

<pre>
foldl (flip const) 0 "burritos"
foldr (flip const) 0 "burritos" -- this one works
-- I don't know why
</pre>

### Case 9

<pre>
foldl (flip const) 'z' [1..5]
foldr (flip const) 'z' [1..5] -- this one works
-- I don't know why
<pre>
