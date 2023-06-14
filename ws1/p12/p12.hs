data OneMany a
  = One a
  | Many
      { count :: Int
      , val   :: a
      }
  deriving (Show)

ungroup :: OneMany a -> [a]
ungroup (One x)                   = [x]
ungroup Many {count = c, val = v} = replicate c v

decodeRunLength :: [OneMany a] -> [a]
decodeRunLength = foldr (\cur acc -> ungroup cur ++ acc) []

getExampleInfo :: (Show a) => [OneMany a] -> String
getExampleInfo l = show l ++ " =>\n" ++ show (decodeRunLength l)

main :: IO ()
main = do
  let l1 =
        [ Many {count = 3, val = True}
        , Many {count = 2, val = False}
        , One True
        , Many {count = 4, val = False}
        ]
  let l2 =
        [ One 1
        , Many {count = 2, val = 2}
        , One 3
        , Many {count = 2, val = 4}
        , One 5
        , Many {count = 3, val = 6}
        , Many {count = 2, val = 7}
        ] :: [OneMany Int]
  putStrLn "Decoding run-length encoded of a list."
  putStrLn "Examples:\n"
  putStrLn $ getExampleInfo l1
  putStrLn $ "\n" ++ getExampleInfo l2
  putStrLn "\nThat's all. Goodbye!"
