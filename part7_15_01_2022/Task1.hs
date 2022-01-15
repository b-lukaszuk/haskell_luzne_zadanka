module Task1 where

-- for non negative integers (args)
-- for relatively small numbers
-- otherwise the program/computer may freeze
-- check for arguments safety:
-- https://en.wikipedia.org/wiki/Ackermann_function#Table_of_values
ackr:: Integer -> Integer -> Integer
ackr 0 n = n + 1
ackr m 0 = ackr (m - 1) 1
ackr m n = ackr (m - 1) $ ackr m (n - 1)

main :: IO ()
main = do
  putStrLn "Program for calculating Ackermann function"
  putStrLn "IT MAY FREEZE THE COMPUTER!, or rather the program, e.g."
  putStrLn "ackr 4 2, is an integer of 19,729 decimal digits"
  putStrLn "For bigger args, like: ackr 4 2, please compile first"
  putStrLn $ "ackr 3 0 = " ++ (show $ ackr 3 0) -- that one is safe
  putStrLn $ "ackr 3 2 = " ++ (show $ ackr 3 2) -- that one as well
