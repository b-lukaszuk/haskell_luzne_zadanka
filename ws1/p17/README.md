# Info

Solving some tasks in Haskell 'at a whim'.

The tasks are from [99 Problems (solved) in OCaml](https://v2.ocaml.org/learn/tutorials/99problems.html) solved with Haskell [to give it (the language and functional programming) another try].

# Problem

Split a list into two parts; the length of the first part is given. (easy)

If the length of the first part is longer than the entire list, then the first part is the list and the second part is empty.

<pre>
# split ["a"; "b"; "c"; "d"; "e"; "f"; "g"; "h"; "i"; "j"] 3;;
- : string list * string list =
(["a"; "b"; "c"], ["d"; "e"; "f"; "g"; "h"; "i"; "j"])
# split ["a"; "b"; "c"; "d"] 5;;
- : string list * string list = (["a"; "b"; "c"; "d"], [])
</pre>

# Additional info

Taken/solved for personal and educational use only.

**The content of this folder may be incorrect, erroneous and/or harmful. Use it at Your own risk.**

**Zawartość niniejszego katalogu może być nieprawidłowa, błędna czy szkodliwa. Używaj na własne ryzyko.**

