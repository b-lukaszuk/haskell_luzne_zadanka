# Ch03

## Reading syntax

### Part 1

Assume those code lines were written in REPL. Are they correct?

a) concat [[1, 2, 3], [4, 5, 6]]
b) ++ [1, 2, 3] [4, 5, 6]
c) (++) "hello" " world"
d) ["hello" ++ " world]
e) 4 !! "hello"
f) (!!) "hello" 4
g) take "4 lovely"
h) take 3 "awesome"

#### My answers

a) correct
b) incorrect, should be: `(++) [1,2,3] [4,5,6]` or `[1,2,3] ++ [4,5,6]`
c) correct
d) incorrect, the `world` is not defined (it is not a string)
e) incorrect, should be: `"hello" !! 4`
f) correct
g) incorrect, the "4" is a part of string
h) correct

### Part 2

Match code line with output

#### code lines

<pre>
a) concat [[1 * 6], [2 * 6], [3 * 6]]
b) "rain" ++ drop 2 "elbow"
c) 10 * head [1, 2, 3]
d) (take 3 "Julie") ++ (tail "yes")
e) concat [tail [1, 2, 3],
	       tail [4, 5, 6],
           tail [7, 8, 9]]
</pre>

#### output lines

<pre>
a) "Jules"
b) [2,3,5,6,8,9]
c) "rainbow"
d) [6,12,18]
e) 10
</pre>

#### My answer

a) - d)
b) - c)
c) - e)
d) - a)
e) - b)

## Building functions

Ehh, again too easy. I will just do the last one, then I'll read the next chapter.

Using only `take` and `drop` write a function called `rvrs` (abbreviated form of 'reverse'). It takes the string "Curry is awesome" and returns the string "awesome is Curry". It is not gonna be pretty, but it is doable using only what we learned so far. It doesn't need to (**and shouldn't**) work for any sentence.

Put the function above into the module, e.g.

<pre>
module Reverse where

rvrs :: String -> String
rvrs x = --sth

main :: IO()
main = print --sth
</pre>
