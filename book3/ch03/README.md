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
