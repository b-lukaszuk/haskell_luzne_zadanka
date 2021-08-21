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
</pre>

### Case 2

<pre>
foldr max [] "fear is the little death" -- incorrect accumulator/reducer,
foldr max ' ' "fear is the little death" -- now it is 'Char'
-- with the lowest possible value for 'Char' (meaningful character in ASCII)
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
foldl ((++) . show) "" [1..5] --  No instance for (Enum [Char])
-- arising from the arithmetic sequence ‘1 .. 5’
foldr ((++) . show) "" [1..5] -- this one works
-- I don't know why, after all show type: 'show :: Show a => a -> String' so it accepts only single argument, not a pair
</pre>

Ok, after some digging in REPL, I came to this conclusion (Actually, solving and describing Case 6 below pushed me to solve Case 5 on my own).

1) The type of: `(++) . show` is: `Show a => a -> [Char] -> [Char]`

2) The type of: `foldl` is: `(b -> a -> b) -> b -> [a] -> b` [its acctually `t a` (`Foldable t`) not `[a]`, but I prefere to think of it as `[a]`]

3) So `foldl` takes a function that takes `b` (`String`, accumulator on the left) and `a` (`Num`, current value on the right) and and returns `String`.

4) `[1..5]` is a list of `Num` or `Enum` whereas based on point 3 we expect it to be `String`, i.e. `[Char]`, that is why we got the error:

<pre>
* No instance for (Enum [Char])
arising from the arithmetic sequence ‘1 .. 5’
</pre>

Note: To better understand the answer to this case (Case 5) it might be helpful to first read a point-by-point answer to Case 6 below.

### Case 6

<pre>
foldr const 'a' [1..5] -- error: No instance for (Num Char) arising from the literal ‘1’
-- why would it like 1 to act as Char b
foldl const 'a' [1..5] -- this one works
foldr (\x b -> const b x) 'a' [1..5] -- this one works as well
-- I don't know why, both "const 'a' 2" and "const 2 'a'" work when typed in ghci
-- and why it says "from the literal 1" and not 5 (it should start folding/evaluating from right)
</pre>

Solution found at: [Stack Overflow](https://stackoverflow.com/questions/36047841/haskell-foldr-results-in-type-error-while-foldl-doesnt)

Briefly (my words):

1) We use `foldr` with the signature:<br>
1.1) `foldr :: (a -> b -> b) -> b -> [a] -> b`<br>
1.2) We evoke it with: `foldr const 'a' [1..5]`<br>
due to the above (especially point 1.2) `a` (list) must be some `Num` and `b` is `Char`

2) `foldr` must return `b` (`Char`)

3) the function send as an argument to `foldr` must return `b` (`Char`)

4) We use `const` as the function (point 3). We send it two arguments:<br>
4.1) on the left the current value of the list (so `a` == `Num`)<br>
4.2) on the right the accumulator (so `b` == `Char`), because `foldr` sets accumulator on the right.<br>
4.3) Based on the definition in `foldr`, i.e. `(a -> b -> b)` (point 1.1) we expect it (`const`) to return `b` which is `Char`<br>

5) Next we use `const` as an argument to `foldr`. But `const` got type of its own:<br>
`const :: a -> b -> a`<br>
so it takes `a` (`Num`, point 4.1) and `b` (`Char`, point 4.2) and it must return `Num` (based on its own definition that we see in point 5)

--

So now we got a conflict:<br>
`foldr` must return `Char` and expects a function that returns `Char` (points 1-4)<br>
and<br>
`const` returns `Num` (point 5)<br>

And only after evaluating `[1..5]` (the last element on the right, so the first from the left) `const` will return `Num` which cannot be implicitly coerced to `Char` that is expected by `foldr`

--

On the other hand, if we use:<br>
`foldl const 'a' [1..5]`<br>
then the function in it (`foldr`) got the following signature `(b -> a -> b)` where `b` is `Char` (our accumulator, the letter `'a'`), `a` is `Num` (an element of the list: `[1..5]`) and `Char` is to be returned

here: `const a -> b -> a` is evoked with `Char` and `Num` and returns `Char`

So, `foldr` expects `Char`, and `const` delivers `Char`, therefore everything is OK.
