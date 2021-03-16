# Info

Tresci zadan skopiowane z tych ktore dostalismy od Karola na podyplomowki JS Developer 2020/2021.

Zadania z dnia 24-10-2020

W ramach treningu rozwiaze je w Haskellu.

# Moj obecny background

Przeczytane 6 pierwszych rozdzialow z [Learn You a Haskell for Great Good!](http://learnyouahaskell.com/chapters).

Dalsze rozdzialy beda czytane/przerabiane w miare mozliwosci.

# Task 6

ARRAY: [1,6,23,8,4,8,3,7]

For time of this example remove last element from the given array. Create a function that based on given array return new array in pattern [a,b,c,d,e] -> [a+b, c+d, e+e]

Hmm, to mam usunac ostatni element, czy go dodac do sibie?
Czy moze usunac ostatni element z [1,6,23,8,4,8,3,7] (powstanie nieparzysta liczba elementow) i potem aplikowac ten pattern?
Zrobie tak i tak i tak.

# Uruchomienie

Wejsc do pliku `addPairsOddsEvens.hs` z Emacsa, i `C-c C-l`

Po pojawieniu sie REPL-a wpisac:

```
addPairsOddsEvens1 nums2
```

lub

```
addPairsOddsEvens2 nums2
```

lub

```
addPairsOddsEvens2 $ removeLastItem nums1
```

i voila.

# Wyjscie

`M-x haskell-session-kill`
