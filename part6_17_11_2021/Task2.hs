module Task2 where

import System.Random
import Text.Printf (printf)

type Prisoner = Int
type Card = Int
type Guess = Int

-- https://wiki.haskell.org/Ternary_operator
data Cond a = a :? a

infixl 0 ?
infixl 1 :?

(?) :: Bool -> Cond a -> a
True  ? (x :? _) = x
False ? (_ :? y) = y
-- usage: test = 1 < 2 ? "Yes" :? "No

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

getMethodCards :: Prisoner -> Guess -> Int -> [Card] -> [Card] -> IO [Card]
getMethodCards _ _ 0 _ acc = return acc
getMethodCards prisId curGuess guessesLeft cards acc =
  let cardInside = cards !! curGuess
  in if prisId == cardInside then return (cardInside : acc)
    else getMethodCards
         prisId cardInside (guessesLeft - 1) cards (cardInside : acc)

getRndCards :: IO [Card]
getRndCards = do
  gen <- getStdGen
  _ <- newStdGen
  return $ take noOfGuesPerPris $ randomRs (0, noOfPris - 1) gen

isAnyCardEqlPrisId :: Prisoner -> [Card] -> Bool
isAnyCardEqlPrisId _ [] = False
isAnyCardEqlPrisId prisId (card:cards) = if card == prisId then True
                                         else isAnyCardEqlPrisId prisId cards

makePrisLookForLuckyCardRand :: [Prisoner] -> [IO Bool]
makePrisLookForLuckyCardRand [] = []
makePrisLookForLuckyCardRand (p:ps) =
  fmap (isAnyCardEqlPrisId p) getRndCards :
  makePrisLookForLuckyCardRand ps

makePrisLookForLuckyCardMeth :: [Prisoner] -> [Card] -> [IO Bool]
makePrisLookForLuckyCardMeth [] _ = []
makePrisLookForLuckyCardMeth (p:ps) cards =
  fmap (isAnyCardEqlPrisId p) (getMethodCards p p noOfGuesPerPris cards []) :
  makePrisLookForLuckyCardMeth ps cards

didAllPrisFoundLuckyCard :: [IO Bool] -> IO Bool
didAllPrisFoundLuckyCard [] = return True
didAllPrisFoundLuckyCard (result:results) = do
  res <- result
  if not res then return False else didAllPrisFoundLuckyCard results

run1IterRand :: IO Bool
run1IterRand = do
  didAllPrisFoundLuckyCard (makePrisLookForLuckyCardRand prisoners)

runNIterRand :: Integer -> [IO Bool]
runNIterRand 0 = []
runNIterRand n =
  run1IterRand : runNIterRand (n-1)

run1IterMeth :: IO Bool
run1IterMeth = do
  cards <- cupboard
  didAllPrisFoundLuckyCard (makePrisLookForLuckyCardMeth prisoners cards)

runNIterMeth :: Integer -> [IO Bool]
runNIterMeth 0 = []
runNIterMeth n =
  run1IterMeth : runNIterMeth (n-1)

calcProb :: Integer -> Integer -> [IO Bool] -> IO Double
calcProb noOfSuc total [] = return (
  (fromIntegral noOfSuc) / (fromIntegral total))
calcProb noOfSuc total (b:bs) = do
  res <- b
  if res
    then calcProb (noOfSuc + 1) (total + 1) bs
    else calcProb noOfSuc (total + 1) bs

displayInfo :: Bool -> IO ()
displayInfo strategyRand = do
    putStrLn "======================================="
    printf "strategy: %s, " $ (strategyRand ? "random" :? "methodical")
    printf "iterations: %d\n" $ noOfIter
    putStrLn "Please be patient, this may take a while"
    prob <- calcProb 0 0 $ (strategyRand ? runNIterRand :? runNIterMeth) noOfIter
    printf "p = %.5f\n" $ prob

-- interesting,
-- calculation of probability in Haskell's REPL is faster than in
-- Python's REPL, (like 10 sec. vs. 45 sec)
-- of course the results are similar
-- still, dealing with random numbers in Haskell is (very) strange
main :: IO ()
main = do
    putStrLn "===="
    putStrLn "Calculating probability of success for:"
    printf "%d prisoners, " $ noOfPris
    printf "%d cards in cupboard\n" $ noOfCards
    printf "%d guesses for each prisoner\n" $ noOfGuesPerPris
    displayInfo True
    displayInfo False
    putStrLn "===="
    putStrLn "That's all. Goodbye."
