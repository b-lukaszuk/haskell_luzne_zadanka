mult' :: Int -> a -> [a] -> [a]
mult' 0 _ acc       = acc
mult' times elt acc = mult' (times - 1) elt (elt:acc)

mult :: Int -> [a] -> [a]
mult _ []         = []
mult times (x:xs) = mult' times x [] ++ mult times xs

getExampleInfo :: (Show a) => Int -> [a] -> String
getExampleInfo t l = show l ++ " times " ++ show t ++ "=> " ++ show (mult t l)

main :: IO ()
main = do
  putStrLn "Multiplying elements of a list n times."
  putStrLn "Examples:\n"
  let l1 = ['a'..'c']
  let l2 = [2..4]
  putStrLn $ getExampleInfo 3 l1
  putStrLn $ getExampleInfo 4 l2
  putStrLn "\nThat's all. Goodbye!"
