module Task2 where

import System.Random
import Text.Printf (printf)

type Prisoner = Int
type Card = Int
type Guess = Int

noOfCards :: Int
noOfCards = 100

noOfPris :: Int
noOfPris = 100

noOfGuesPerPris :: Int
noOfGuesPerPris = 50

noOfIter :: Integer
noOfIter = 10000

prisoners :: [Prisoner]
prisoners = [0..(noOfPris-1)]

-- https://programming-idioms.org/idiom/10/shuffle-a-list/826/haskell
shuffle :: [a] -> IO [a]
shuffle x = if length x < 2 then return x else do
  i <- System.Random.randomRIO (0, length(x)-1)
  r <- shuffle (take i x ++ drop (i+1) x)
  return (x!!i : r)

-- interesting, when i load the file (e.g by :load Task2.hs)
-- each time i type cupboard in the REPL i get a different list
-- but in do statement it does not change, e.g.
-- main = do
-- cards <- cupboard
-- putStrLn $ show cards
-- putStrLn $ show cards
-- why is that?
cupboard :: IO [Card]
cupboard = shuffle [0..(noOfCards - 1)]

getRndNum :: IO Int
getRndNum = getStdRandom (randomR (0, noOfCards - 1))

getCardIndex :: Int -> Bool -> IO Int
getCardIndex curGuess methRnd = if methRnd then getRndNum else return curGuess

getCards :: Prisoner -> Guess -> Int -> [Card] -> [Card] -> Bool -> IO [Card]
getCards _ _ 0 _ acc _ = return acc
getCards prisId curGuess guessesLeft cards acc methRnd = do
  cardIndex <- getCardIndex curGuess methRnd
  let cardIn = cards !! cardIndex
  if prisId == cardIn then return (cardIn : acc)
    else getCards prisId cardIn (guessesLeft - 1) cards (cardIn : acc) methRnd

isACardEqlPrisId :: Prisoner -> [Card] -> Bool
isACardEqlPrisId _ [] = False
-- getCards stops generating when it hit lucky card (lck:cards) or
-- when reached noOfGuesPerPris (card:cards), anyway need to check fst card only
isACardEqlPrisId prisId (card:_) = card == prisId

mkPrisLookForLuckyCard :: [Prisoner] -> [Card] -> Bool -> [IO Bool]
mkPrisLookForLuckyCard [] _ _ = []
mkPrisLookForLuckyCard (p:ps) cards methRnd =
  let guesses = getCards p p noOfGuesPerPris cards [] methRnd
  in fmap (isACardEqlPrisId p) guesses :
     (mkPrisLookForLuckyCard ps cards methRnd)

didAllPrisFoundLuckyCard :: [IO Bool] -> IO Bool
didAllPrisFoundLuckyCard [] = return True
didAllPrisFoundLuckyCard (result:results) = do
  res <- result
  if not res then return False else didAllPrisFoundLuckyCard results

run1Iter :: Bool -> IO Bool
run1Iter methRnd = do
  cards <- cupboard
  didAllPrisFoundLuckyCard $ mkPrisLookForLuckyCard prisoners cards methRnd

runNIter :: Integer -> Bool -> [IO Bool]
runNIter 0 _ = []
runNIter n methRnd = (run1Iter methRnd) : (runNIter (n - 1) methRnd)

calcProb :: Integer -> Integer -> [IO Bool] -> IO Double
calcProb noOfSuc total [] = return (
  (fromIntegral noOfSuc) / (fromIntegral total))
calcProb noOfSuc total (b:bs) = do
  res <- b
  if res
    then calcProb (noOfSuc + 1) (total + 1) bs
    else calcProb noOfSuc (total + 1) bs

displayInfo :: Bool -> IO ()
displayInfo strategyRnd = do
    putStrLn "======================================="
    printf "strategy: %s, " $ if strategyRnd then "random" else "methodical"
    printf "iterations: %d\n" $ noOfIter
    putStrLn "Please be patient, this may take a while"
    prob <- calcProb 0 0 $ runNIter noOfIter strategyRnd
    printf "p = %.5f\n" $ prob

-- interesting,
-- calculation of probability in Haskell's REPL is faster than in
-- Python's REPL, (like 12.5 sec. vs. 45 sec)
-- of course the algorithms and the results are similar
-- still, dealing with random numbers in Haskell is (very) strange
main :: IO ()
main = do
    putStrLn "===="
    putStrLn "Calculating probability of success for:"
    printf "%d prisoners, %d cards in cupboard\n" noOfPris noOfCards
    printf "%d guesses for each prisoner\n" $ noOfGuesPerPris
    displayInfo True
    displayInfo False
    putStrLn "===="
    putStrLn "That's all. Goodbye."
