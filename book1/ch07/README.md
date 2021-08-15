# Ch07

Choosen exercises (some were too easy, or not enough interesting) from Chapter 7 (rest of the exercises were solved 'in head')

---

# Table of contents

1. [Grab Bag](#grab-bag)

---

## Grab bag

[Go to: Table of contents](#table-of-contents)

Solutions are in file `anonymous.hs`

### Case a

Rewrite the f function in the where clause to lambda syntax

<pre>
addOneIfOdd n = case odd n of
  True -> f n
  False -> n
  where f n = n + 1
</pre>

### Case b

Rewrite the following to use anonymous lambda syntax

<pre>
addFive x y = (if x > y then y else x) + 5
</pre>

### Case c

Rewrite the following so that it doesn't use lambda syntax

<pre>
mfilp f = \x -> \y -> f y x
</pre>
