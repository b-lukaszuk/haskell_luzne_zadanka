-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import System.Random

-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
nums ::  [Int]
nums = [1, 6, 23, 8, 4, 8, 3, 7]

-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
-- randomly gets 0 or 1
-- returns (zeroOrOne, nextRandomGen)
get0or1 :: (RandomGen g) => g -> (Int, g)
get0or1 gen = randomR (0, 1) gen

-- gets a random sequence of 0/1 of given length
-- funkcja pomocnicza do testowania poprawnosci operacji z main-a
getSeqOf0or1 :: (RandomGen g) => Int -> g -> [Int]
getSeqOf0or1 0 _ = []
getSeqOf0or1 howMany gen =
  let result = get0or1 gen
  in fst result : (getSeqOf0or1 (howMany - 1) (snd result))

-- gets a sequence of consecutive randNumGens
getSeqOfRandGens :: (RandomGen g) => Int -> g -> [g]
getSeqOfRandGens 0 _ = []
getSeqOfRandGens howMany gen =
  let (_, nextGen) = get0or1 gen
  in gen : (getSeqOfRandGens (howMany - 1) nextGen)

-- randomly adds or subtracts two numbers
-- returns (result, nextRandomGen)
addOrSubtr :: (RandomGen g, Num a) => a -> a -> g -> (a, g)
addOrSubtr num1 num2 gen =
  let (choice, nextGen) = get0or1 gen
      result = if choice == 0
        then num1 + num2
        else num1 - num2
  in (result, nextGen)

getLstOfNumsAndRandGens :: (RandomGen g, Num a) => [a] -> g -> [(a, g)]
getLstOfNumsAndRandGens someNums startGen =
  zip someNums $ getSeqOfRandGens (length someNums) startGen

-- returns (resultOfRandAddSubtr, nextGen)
addOrSubtrElts :: (RandomGen g, Num a) => [a] -> g -> (a, g)
addOrSubtrElts someNums startGen =
  let numsAndGens = getLstOfNumsAndRandGens someNums startGen
  in foldl1 (\acc x -> addOrSubtr (fst acc) (fst x) (snd acc)) numsAndGens


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  gen <- getStdGen
  putStrLn $ "Given the list: " ++ show nums
  let seq01 = getSeqOf0or1 (length nums - 1) gen
  -- fst - cause we get (result, nextGen)
      result = fst $ addOrSubtrElts nums gen
  putStrLn $ "After performing these operations (with lfold1): " ++ show seq01
  putStrLn "where: 0 - addition, 1 - subtraction"
  putStrLn $ "we get: " ++ show result

-- moja znajomosc Haskell-a jest ograniczona
-- jakkolwiek w stosunku do innyc jezykow programowania
-- poslugiwanie sie liczbami losowymi w Haskellu wydaje sie byc niekomfortowe
-- takie przynajmniej jest moje pierwsze wrazenie
