Some of the tasks from Chapter 3 of [Real World Haskell](http://book.realworldhaskell.org/read/) by Bryan O'Sullivan, Don Stewart, and John Goerzen

# Task 1

> Write the converse of fromList for the List type: a function that takes a List a and generates a [a].

<pre>
data List a = Cons a (List a) | Nil deriving (Show)
</pre>

# Task 2

>Define a tree type that has only one constructor, like our Java example. Instead of the Empty constructor, use the Maybe type to refer to a node's children.

Java constructor:

<pre>
class Tree<A>
{
    A value;
    Tree<A> left;
    Tree<A> right;

    public Tree(A v, Tree<A> l, Tree<A> r)
    {
	value = v;
	left = l;
	right = r;
    }
}
</pre>

Haskell Tree (previous example)

<pre>
data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)
</pre>

# Task 3

> Create a function that sorts a list of lists based on the length of each sublist. (You may want to look at the sortBy function from the Data.List module.)

# Task 4

> Define a function that joins a list of lists together using a separator value.

The function's type signature

<pre>
intersperse :: a -> [[a]] -> [a]
</pre>

> The separator should appear between elements of the list, but should not follow the last element. Your function should behave as follows.

# Task 5

> Using the binary tree type that we defined earlier in this chapter, write a function that will determine the height of the tree. The height is the largest number of hops from the root to an Empty. For example, the tree Empty has height zero; Node "x" Empty Empty has height one; Node "x" Empty (Node "y" Empty Empty) has height two; and so on.

Reminder (the tree type definition):

<pre>
data Tree a = Node a (Tree a) (Tree a)
            | Empty
              deriving (Show)
</pre>

# Task 6

> Consider three two-dimensional points a, b, and c. If we look at the angle formed by the line segment from a to b and the line segment from b to c, it either turns left, turns right, or forms a straight line. Define a Direction data type that lets you represent these possibilities.

# Task 7

> Write a function that calculates the turn made by three 2D points and returns a Direction.

# Task 8

> Define a function that takes a list of 2D points and computes the direction of each successive triple. Given a list of points [a,b,c,d,e], it should begin by computing the turn made by [a,b,c], then the turn made by [b,c,d], then [c,d,e]. Your function should return a list of Direction.

# Task 9

> Using the code from the preceding three exercises, implement Graham's scan algorithm for the convex hull of a set of 2D points. You can find good description of what a convex hull. is, and how the Graham scan algorithm should work, on Wikipedia.

From [Wikipedia](https://en.wikipedia.org/wiki/Main_Page):
- [Convex hull](https://en.wikipedia.org/wiki/Convex_hull)
- [Graham scan](https://en.wikipedia.org/wiki/Graham_scan)
