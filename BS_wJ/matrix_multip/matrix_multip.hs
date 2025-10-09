import           Data.List (intercalate)

type Matrix = [[Int]]

mat2str :: Matrix -> String
mat2str mat = intercalate "\n" $ map show mat

-- needed overlapping pragma, since list of lists (Matrix) already got show
instance {-# OVERLAPPING #-} Show Matrix where
  show m = mat2str m

getCol :: Matrix -> Int -> [Int]
getCol mat n = map (\row -> row !! n) mat

getCols' :: Matrix -> Int -> [[Int]]
getCols' mat n
  | n < 0 = []
  | otherwise = (getCol mat n) : getCols' mat (n-1)

getNCols :: Matrix -> Int
getNCols m = length $ head m

getCols :: Matrix -> [[Int]]
getCols mat = reverse $ getCols' mat $ (getNCols mat - 1)

getDotProd :: [Int] -> [Int] -> Int
getDotProd row col = sum $ zipWith (*) row col

multRowByCols :: [Int] -> Matrix -> [Int]
multRowByCols row cols = [getDotProd row col | col <- cols]

multiply :: Matrix -> Matrix -> Matrix
multiply m n = [multRowByCols row (getCols n) | row <- m]

a :: Matrix
a = [[1, 2, 3], [4, 5, 6]]
b :: Matrix
b = [[7, 8], [9, 10], [11, 12]]

c :: Matrix
c = [[-1, 3, 5], [5, 5, 2]]
d :: Matrix
d = [[3, 4], [3, -2], [4, -2]]

-- uncomment appropriate line below and copy-paste the snippet to ghci (REPL):
-- multiply a b
-- multiply c d
