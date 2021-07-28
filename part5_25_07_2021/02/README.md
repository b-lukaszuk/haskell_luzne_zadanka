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

## Task 2

Zadania z [youtube](https://www.youtube.com/watch?v=Cxkqrg8FCt8&list=PLe7Ei6viL6jGp1Rfu0dil1JH1SHk9bgDV&index=5)

### Task 2.1

Napisz funkcje `elem` (sprawdza czy jakis element/atom jest czescia listy) o sygnaturze:

```haskell
elem :: (Eq a) => a -> [a] -> Bool
```

### Task 2.2

Napisz funkcje `nub` usuwajaca duplikaty z listy, sygnatura:

```haskell
nub :: (Eq a) => [a] -> a
```

### Task 2.3

Napisz funkcje `isAsc` sprawdzajaca czy lista jest uszeregowana rosnaca, sygnatura:

```haskell
isAsc :: [Int] -> Bool
```

### Task 2.4

Majac dany graf (polaczenia jedno-kierunkowe):

```haskell
graph :: [(Int, Int)]
graph = [(1, 2), (2, 3), (3, 2), (4, 3), (4, 5)]
```

Napisz funkcje `hasPath` testujaca istnienie polaczenia miedzy dwoma node-ami w grafie.
Nie testuj na obecnosc wezlow, po prostu zaloz, ze one sa w grafie.
Sygnatura:

```haskell
hasPath :: [(Int, Int)] -> Int -> Int -> Bool
```
