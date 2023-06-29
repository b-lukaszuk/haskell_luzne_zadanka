# Info

Solving some tasks in Haskell 'at a whim'.

The tasks are from [99 Problems (solved) in OCaml](https://v2.ocaml.org/learn/tutorials/99problems.html) solved with Haskell [to give it (the language and functional programming) another try].

# Problem

Insert an element at a given position into a list. (easy)

Start counting list elements with 0. If the position is larger or equal to the length of the list, insert the element at the end. (The behavior is unspecified if the position is negative.)

<pre>
# insert_at "alfa" 1 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "alfa"; "b"; "c"; "d"]
# insert_at "alfa" 3 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "b"; "c"; "alfa"; "d"]
# insert_at "alfa" 4 ["a"; "b"; "c"; "d"];;
- : string list = ["a"; "b"; "c"; "d"; "alfa"]
</pre>

# Additional info

Taken/solved for personal and educational use only.

**The content of this folder may be incorrect, erroneous and/or harmful. Use it at Your own risk.**

**Zawartość niniejszego katalogu może być nieprawidłowa, błędna czy szkodliwa. Używaj na własne ryzyko.**

