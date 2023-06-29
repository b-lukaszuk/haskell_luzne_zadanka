-- haskell got build in take, drop and splitAt, I will write my own versions

-- requirement, n >= 0
myTake :: Int -> [a] -> [a]
myTake _ []     = []
myTake 0 _      = []
myTake n (x:xs) = x : myTake (n-1) xs

-- requirement, n >= 0
myDrop :: Int -> [a] -> [a]
myDrop _ []     = []
myDrop 0 xs     = xs
myDrop n (_:xs) = myDrop (n-1) xs

-- requirement, n >= 0
mySplitAt :: Int -> [a] -> [[a]]
mySplitAt n l = [myTake n l, myDrop n l]

getExampleInfo :: (Show a) => Int -> [a] -> String
getExampleInfo n l =
  show l ++ " splitting at " ++ show n ++ " => " ++ show (mySplitAt n l)

main :: IO ()
main = do
  putStrLn "Splitting list at n-th element."
  putStrLn "Examples:\n"
  let l1 = ['a'..'k']
  let l2 = [1..12] :: [Int]
  let l3 = [1..4] :: [Int]
  putStrLn $ getExampleInfo 2 l1
  putStrLn $ getExampleInfo 9 l2
  putStrLn $ getExampleInfo 5 l3
  putStrLn "\nThat's all. Goodbye!"
