---

# Table of contents

1. [Info](#info)
2. [Task 1](#task-1)
3. [Task 2](#task-2)
4. [Task 3](#task-3)
5. [Task 4](#task-4)
6. [Task 5](#task-5)

---

# Info

Tasks from [Rosetta Code. Category: Programming Tasks](https://rosettacode.org/wiki/Category:Programming_Tasks)

# Task 1

[Go to: Table of contents](#table-of-contents)

[100 doors](https://rosettacode.org/wiki/100_doors):

There are 100 doors in a row that are all initially closed.

You make 100 passes by the doors.

The first time through, visit every door and  toggle  the door  (if the door is closed,  open it;   if it is open,  close it).

The second time, only visit every 2nd door   (door #2, #4, #6, ...),   and toggle it.

The third time, visit every 3rd door   (door #3, #6, #9, ...), etc,   until you only visit the 100th door.

**Answer the question:** what state are the doors in after the last pass? Which are open, which are closed?


# Task 2

[Go to: Table of contents](#table-of-contents)

[100 prisoners](https://rosettacode.org/wiki/100_prisoners)

## The Problem

100 prisoners are individually numbered 1 to 100

A room having a cupboard of 100 opaque drawers numbered 1 to 100, that cannot be seen from outside.

Cards numbered 1 to 100 are placed randomly, one to a drawer, and the drawers all closed; at the start.

Prisoners start outside the room
- They can decide some strategy before any enter the room.
- Prisoners enter the room one by one, can open a drawer, inspect the card number in the drawer, then close the drawer.
- A prisoner can open no more than 50 drawers.
- A prisoner tries to find his own number.
- A prisoner finding his own number is then held apart from the others.
- If all 100 prisoners find their own numbers then they will all be pardoned. If any don't then all sentences stand.

## What to do

Simulate several thousand instances of the game where the prisoners randomly open drawers
Simulate several thousand instances of the game where the prisoners use the optimal strategy mentioned in the Wikipedia article, of:
- First opening the drawer whose outside number is his prisoner number.
- If the card within has his number then he succeeds otherwise he opens the drawer with the same number as that of the revealed card. (until he opens his maximum).

Show and compare the computed probabilities of success for the two strategies.

# Task 3

[Go to: Table of contents](#table-of-contents)

[99 bottles of beer](https://rosettacode.org/wiki/99_bottles_of_beer)

## What to do

Display the complete lyrics for the song: **99 Bottles of Beer on the Wall.**

**The beer song**

The lyrics follow this form:

<pre>
99 bottles of beer on the wall
99 bottles of beer
Take one down, pass it around
98 bottles of beer on the wall

98 bottles of beer on the wall
98 bottles of beer
Take one down, pass it around
97 bottles of beer on the wall
</pre>

... and so on, until reaching 0 (zero).

Grammatical support for 1 bottle of beer is optional.

As with any puzzle, try to do it in as creative/concise/comical a way as possible (simple, obvious solutions allowed, too).

# Task 4

[Go to: Table of contents](#table-of-contents)

Inspired by: [Birthday problem](https://en.wikipedia.org/wiki/Birthday_problem):

## The problem

Let's say there are 30 people at a party. What is the probability that any two individuals celebrate their birthday the same day.

## What to do

Write a computer simulation to calculate the probability specified above (say 10k iterations).

## Assumptions

List of assumptions:
+ every year got exactly 365 days
+ people's births are distributed equaly throughout the year (uniform distribution)
+ use only standard Haskell's libraries (the one you get out of the box)


# Task 5

[Go to: Table of contents](#table-of-contents)

[A+B](https://rosettacode.org/wiki/A%2BB):

## Description

A+B ─ a classic problem in programming contests, it's given so contestants can gain familiarity with the online judging system being used.

Given two integers, A and B.

Their sum needs to be calculated.

Input data
Two integers are written in the input stream, separated by space(s):

(-1000 <= A,B >= +1000)

Output data
The required output is one integer: the sum of A and B.

Example

<pre>
input  |    output
 2 2   |       4
 3 2   |       5
</pre>

 ## Running program

 ```bash
 runhaskell Task5.hs 2 3
 ```

 ## Additional info

 Does not check its input for corectness. Takes only the first two args.
