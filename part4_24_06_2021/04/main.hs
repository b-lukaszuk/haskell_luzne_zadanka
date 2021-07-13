-------------------------------------------------------------------------------
--                                  importy                                  --
-------------------------------------------------------------------------------
import Matrix (multMatr, matrToString)


-------------------------------------------------------------------------------
--                              zmienne globalne                             --
-------------------------------------------------------------------------------
-- see: https://www.mathsisfun.com/algebra/matrix-multiplying.html
-- for: matrix1 * matrix2 or matrix3 * matrix4
matrix1 :: [[Int]]
matrix1 = [[1, 2, 3], [4, 5, 6]]

matrix2 :: [[Int]]
matrix2 = [[7, 8], [9, 10], [11, 12]]

matrix3 :: [[Int]]
matrix3 = [[3, 4, 2]]

matrix4 :: [[Int]]
matrix4 = [[13, 9, 7, 15], [8, 7, 4, 6], [6, 4, 0, 3]]

matrix5 :: [[Int]]
matrix5 = [[1, 2], [1, 2, 3], [1, 2, 3, 4]]


-------------------------------------------------------------------------------
--                                  funkcje                                  --
-------------------------------------------------------------------------------
declareMult :: [[Int]] -> [[Int]] -> String
declareMult mat1 mat2 = let resultStr = matrToString $ multMatr mat1 mat2
                        in matrToString mat1 ++ "\nmultiplied by:\n\n" ++
                           matrToString mat2 ++ "\ngives:\n\n" ++
                           resultStr ++ "\n======\n"


-------------------------------------------------------------------------------
--                             wykonanie programu                            --
-------------------------------------------------------------------------------
main :: IO()
main = do
  putStrLn "Hello. Let's do some matrix multiplication.\n"
  putStrLn $ declareMult matrix1 matrix2
  putStrLn $ declareMult matrix3 matrix4
  -- two lines below should throw an error
  -- putStrLn $ declareMult matrix2 matrix3
  -- putStrLn $ declareMult matrix5 matrix1
  putStrLn "That's it. Goodbye!"
