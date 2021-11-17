module Task1 where

data Door = Closed | Open deriving (Eq, Show)

toggle :: Door -> Door
toggle Closed = Open
toggle Open = Closed

doors :: [Door]
doors = replicate 100 Closed

noOfPassage :: [Int]
noOfPassage = [1..100]

isDivisible :: Int -> Int -> Bool
isDivisible what byWhat = mod what byWhat == 0

toggleEveryNthDoor :: Int -> [Door] -> [Door]
toggleEveryNthDoor n someDoors =
  let doorsWithInd = zip [1..] someDoors
  in foldr
     (\(serialNo, door) acc ->
        if isDivisible serialNo n then (toggle door) : acc else door : acc)
     [] doorsWithInd

toggleDoorsMutlipleTimes :: [Int] -> [Door] -> [Door]
toggleDoorsMutlipleTimes indexes someDoors =
  foldr (\curInd acc -> toggleEveryNthDoor curInd acc) someDoors indexes

getDoorsWithStatus :: Door -> [Door] -> [(Int, Door)]
getDoorsWithStatus status someDoors =
  [x | x <- (zip [1..] someDoors), (snd x) == status]

main :: IO ()
main = do
  putStrLn "I got 100 doors. All of them are closed at the moment."
  putStrLn "I go 100 times to the set of doors."
  putStrLn "If the index of a door is divisible by the current number of passage"
  putStrLn "I change its state to the opposite"
  putStrLn "At the end the only open doors are:"
  putStrLn $ show $ getDoorsWithStatus Open $ toggleDoorsMutlipleTimes noOfPassage doors
