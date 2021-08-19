# Ch10

Choosen exercises (some were too easy, or not enough interesting) from Chapter 10 (rest of the exercises were solved 'in head' or not at all)

---

# Table of contents

1. [Understanding Folds](#understanding-folds)

---

## Understanding folds

[Go to: Table of contents](#table-of-contents)

Fix the mistakes in the code snippets below (check in in REPL):

<pre>
foldr (++) ["woot", "WOOT", "woot"]
foldr (++) [] ["woot", "WOOT", "woot"] -- accumulator was missing

foldr max [] "fear is the little death"
foldr max ' ' "fear is the little death" -- incorrect accumulator, now it is 'Char' with the lowest possible value for 'Char' (meaningful character in ASCII)

foldr and True [False, True] -- 'and' takes a list (foldable) of Bools
foldr (&&) True [False, True] -- '&&' takes two 'Bool'-s

-- This one is more subtle than the previous. Can it ever return a different answer?
foldr (||) True [False, True] -- here '(||)' is the first evaluated argument (first pair),
-- so it will always give 'True' no matter the list (short circuiting of logical-or)
foldr (||) False [False, True] -- the accumulator should be 'False'

foldl ((++) . show) "" [1..5]
foldr ((++) . show) "" [1..5] -- this one works
-- I don't know why, after all show type: 'show :: Show a => a -> String' so it accepts only single argument, not a pair

foldr const 'a' [1..5]
foldl const 'a' [1..5] -- this one works
-- I don't know why, both "const 'a' 2" and "const 2 'a'" work when typed in ghci

foldr const 0 "tacos"
foldl const 0 "tacos" -- this one works
-- I don't know why, both "const 0 't' and "const 't' 0" work when typed in ghci
-- the reason should be the same (or similar like in the case above)

foldl (flip const) 0 "burritos"
foldr (flip const) 0 "burritos" -- this one works
-- I don't know why

foldl (flip const) 'z' [1..5]
foldr (flip const) 'z' [1..5] -- this one works
-- I don't know why
<pre>
