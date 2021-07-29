# Info

Tresci zadan skopiowane z tych ktore dostalismy od Karola na podyplomowki JS Developer 2020/2021.

W ramach treningu rozwiaze je w Haskellu.

**Pominieto zadanie zbyt JS-owe, iff-e, obiekty**, bo tego za bardzo nie ma w Haskell-u.


# Moj obecny background

Przeczytane 6 pierwszych rozdzialow z [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters).

Dalsze rozdzialy beda czytane/przerabiane w miare mozliwosci.

## Update

### 05-04-2021

Doczytano rozdzialy 7-9. Rozdzial 9 potrzebny do random numbers (rozwiazanie niektorych zadan)

## Task 3

Zadania z [Real World Haskell](http://book.realworldhaskell.org/read/functional-programming.html)
Taken for personal use only!

### Task 3.1

Write your own “safe” definitions of the standard partial list functions, but make sure that yours never fail. As a hint, you might want to consider using the following types.

```haskell
safeHead :: [a] -> Maybe a
safeTail :: [a] -> Maybe [a]
safeLast :: [a] -> Maybe a
safeInit :: [a] -> Maybe [a]
```

### Task 3.2

Write a function splitWith that acts similarly to words, but takes a predicate and a list of any type, and splits its input list on every element for which the predicate returns False.

```haskell
splitWith :: (a -> Bool) -> [a] -> [[a]]
```

### Task 3.3

Write a program that transposes the text in a file. For instance, it should convert `"hello\nworld\n"` to `"hw\neo\nlr\nll\nod\n"`

# Uruchomienie

Otworzyc plik `main.hs` z Emacs-a, potem `C-c C-l`

Testowac do woli po pojawieniu sie REPL-a.

# Wyjscie

`M-x haskell-session-kill`
