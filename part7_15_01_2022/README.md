---

# Table of contents

1. [Info](#info)
2. [Task 1](#task-1)

---

# Info

Tasks from [Rosetta Code. Category: Programming Tasks](https://rosettacode.org/wiki/Category:Programming_Tasks)

# Task 1

[Go to: Table of contents](#table-of-contents)

[Akermann function](https://rosettacode.org/wiki/Ackermann_function):

## Description

The Ackermann function is usually defined as follows:

<pre>
A(m, n) = n + 1, if m = 0
A(m, n) = A(m-1, 1), if m > 0 and n = 0
A(m, n) = A(m-1, A(m, n-1)), if m > 0 and n > 0
</pre>

Write a function which returns the value of A(m, n). Arbitrary precision is preferred (since the function grows so quickly), but not required.
