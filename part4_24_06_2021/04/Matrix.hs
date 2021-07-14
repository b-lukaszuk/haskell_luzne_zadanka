module Matrix (multMatr, matrToString) where


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
getNrow :: [[Int]] -> Int
getNrow [] = 0
getNrow xs = length xs

getNcols :: [[Int]] -> [Int]
getNcols [] = [0]
getNcols xs = map length xs

getDims :: [[Int]] -> [Int]
getDims xs = [getNrow xs, head $ getNcols xs]

areAllColsLensEq :: [[Int]] -> Bool
areAllColsLensEq [] = False
areAllColsLensEq xs = let colLens = getNcols xs
                      in all (==head colLens) colLens

areDimsOK :: [[Int]] -> [[Int]] -> Bool
areDimsOK [] _ = False
areDimsOK _ [] = False
areDimsOK matr1 matr2 = if areAllColsLensEq matr1 && areAllColsLensEq matr2
  then (head $ getNcols matr1) == getNrow matr2
  else error "One of the matrices got unstable number of columns"

dotProd :: [Int] -> [Int] -> Int
dotProd matr1d matr1d' = sum $ zipWith (*) matr1d matr1d'

getColNum :: Int -> [[Int]] -> [Int]
getColNum _ [] = []
getColNum num xs = map (!! num) xs

getAllCols :: [[Int]] -> [[Int]]
getAllCols [] = []
getAllCols matr1 = let nCols = (head $ getNcols matr1) - 1
                   in zipWith getColNum [0..nCols] $ cycle [matr1]

-- multiplies matrices with correct dimentsions only (does not perform check)
multMatr' :: [[Int]] -> [[Int]] -> [[Int]]
multMatr' [] _ = []
multMatr' _ [] = []
multMatr' (x:xs) ys = let resRow = zipWith dotProd (cycle [x]) $ getAllCols ys
                     in resRow : multMatr' xs ys

multMatr :: [[Int]] -> [[Int]] -> [[Int]]
multMatr matr1 matr2 = if not $ areDimsOK matr1 matr2
  then let dims1 = show $ getDims matr1
           dims2 = show $ getDims matr2
           msg = "Incorrect matrices dimensions. Reqired [a, b] * [b, c]" ++
             " but got: " ++ dims1 ++ " and " ++ dims2
       in error msg
  else multMatr' matr1 matr2

matrToListOfStr' :: [[Int]] -> [String]
matrToListOfStr' [] = []
matrToListOfStr' (x:xs)  = show x : "\n" : matrToListOfStr' xs

myConcat :: [String] -> String
myConcat [] = ""
myConcat (x:xs) = x ++ myConcat xs

matrToString :: [[Int]] -> String
matrToString matr  = myConcat $ matrToListOfStr' matr
