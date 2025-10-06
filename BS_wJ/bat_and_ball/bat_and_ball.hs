import           Data.List   (intercalate)
import           Text.Printf (printf)

type Matrix = [[Double]]

mat2str :: Matrix -> String
mat2str mat = intercalate "\n" $ map show mat

-- needed overlapping pragma, since list of lists (Matrix) already got show
instance {-# OVERLAPPING #-} Show Matrix where
  show m = mat2str m

getCol :: Matrix -> Int -> [Double]
getCol mat n = map (\row -> row !! n) mat

getCols' :: Matrix -> Int -> [[Double]]
getCols' mat n
  | n < 0 = []
  | otherwise = (getCol mat n) : getCols' mat (n-1)

getNCols :: Matrix -> Int
getNCols m = length $ head m

getCols :: Matrix -> [[Double]]
getCols mat = reverse $ getCols' mat $ (getNCols mat - 1)

getDotProd :: [Double] -> [Double] -> Double
getDotProd row col = sum $ zipWith (*) row col

multRowByCols :: [Double] -> Matrix -> [Double]
multRowByCols row cols = [getDotProd row col | col <- cols]

multiply :: Matrix -> Matrix -> Matrix
multiply m n = [multRowByCols row (getCols n) | row <- m]

getValAtIndex :: Matrix -> Int -> Int -> Double
getValAtIndex m r c = (m !! r) !! c

getDeterminant2x2 :: Matrix -> Double
getDeterminant2x2 m =  firstPart - secondPart
  where firstPart = (getValAtIndex m 0 0) * (getValAtIndex m 1 1)
        secondPart = (getValAtIndex m 0 1) * (getValAtIndex m 1 0)

getDeterminant2x2Reciprocal :: Matrix -> Double
getDeterminant2x2Reciprocal m = 1.0 / (getDeterminant2x2 m)

getSwap :: Matrix -> Matrix
getSwap m = [[a, b], [c, d]]
  where a = getValAtIndex m 1 1
        b = (getValAtIndex m 0 1) * negate 1
        c = (getValAtIndex m 1 0) * negate 1
        d = (getValAtIndex m 0 0)

getInverse2x2 :: Matrix -> Matrix
getInverse2x2 m = [[reciprocal * (getValAtIndex swap r c) |
                    c <- [0..nCols-1]] | r <- [0..nRows-1]]
  where reciprocal = getDeterminant2x2Reciprocal m
        swap = getSwap m
        nRows = length swap
        nCols = getNCols swap

getPrices :: Matrix -> Matrix -> Matrix
getPrices m n = multiply (getInverse2x2 m) n

roundTo :: Double -> Int -> String
roundTo flt nDec = printf ("%." ++ show nDec ++ "f") flt

round2 :: Double -> String
round2 flt = roundTo flt 2

a :: Matrix
a = [[1, 1], [1, negate 1]] -- left site of equations (bat + ball)
b :: Matrix
b = [[1.1], [1.0]] -- right site of equations (sums)

-- copy-past to ghci:
-- map (map round2) $ getPrices a b
