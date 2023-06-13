# Info

Solving some tasks in Haskell 'at a whim'.

The tasks are from [99 Problems (solved) in OCaml](https://v2.ocaml.org/learn/tutorials/99problems.html) solved with Haskell [to give it (the language and functional programming) another try].

# Problem

Modified run-length encoding. (easy)

Modify the result of the previous problem in such a way that if an element has no duplicates it is simply copied into the result list. Only elements with duplicates are transferred as (N E) lists.

 <pre>
# type 'a rle =
    | One of 'a
    | Many of int * 'a;;
type 'a rle = One of 'a | Many of int * 'a

# encode ["a"; "a"; "a"; "a"; "b"; "c"; "c"; "a"; "a"; "d"; "e"; "e"; "e"; "e"];;
- : string rle list =
[Many (4, "a"); One "b"; Many (2, "c"); Many (2, "a"); One "d"; Many (4, "e")]
 </pre>

# Additional info

Taken/solved for personal and educational use only.

**The content of this folder may be incorrect, erroneous and/or harmful. Use it at Your own risk.**

**Zawartość niniejszego katalogu może być nieprawidłowa, błędna czy szkodliwa. Używaj na własne ryzyko.**

