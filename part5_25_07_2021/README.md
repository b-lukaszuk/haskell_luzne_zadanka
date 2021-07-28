---

# Table of contents

1. [Info](#info)
2. [Moj obecny background](#moj-obecny-background)
3. [Tasks](#tasks)
   + [Task 1](#task-1)
   + [Task 2](#task-2)
4. [Info dodatkowe](#info-dodatkowe)

---

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

# Tasks

## Task 1

### Table

<pre>
+-------------------------+
¦ 34 ¦ 21 ¦ 32 ¦ 41 ¦ 25  ¦
+----+----+----+----+-----¦
¦ 14 ¦ 42 ¦ 43 ¦ 14 ¦ 31  ¦
+----+----+----+----+-----¦
¦ 54 ¦ 45 ¦ 52 ¦ 42 ¦ 23  ¦
+----+----+----+----+-----¦
¦ 33 ¦ 15 ¦ 51 ¦ 31 ¦ 35  ¦
+----+----+----+----+-----¦
¦ 21 ¦ 52 ¦ 33 ¦ 13 ¦ 23  ¦
+-------------------------+
</pre>

### Task Description

Do you like treasure hunts? In this problem you are to write a program to explore the above array for a treasure. The values in the array are clues. Each cell contains an integer between 11 and 55; for each value the ten's digit represents the row number and the unit's digit represents the column number of the cell containing the next clue. Starting in the upper left corner (at 1,1), use the clues to guide your search of the array. (The first three clues are 11, 34, 42). The treasure is a cell whose value is the same as its coordinates. Your program should output the cells it visits during its search, and a message indicating where you found the treasure.

Tu Karol mowil, ze styl dowolny.

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
nub :: (Eq a) => [a] -> [a]
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

# Info dodatkowe

## Do użytku własnego, nie zalecane do użytku przez nikogo innego.

## For personal use only, not recommended to be used by anyone else.

