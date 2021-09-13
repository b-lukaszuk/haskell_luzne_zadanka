module Multiplication where

import Test.Hspec

mult :: Integer -> Integer -> Integer
mult x y = mult' x y 0
  where mult' x' y' acc
          | y' == 0 = acc
          | otherwise = mult' x' (y'-1) (acc + x')

main :: IO ()
main = hspec $ do
  describe "Multiplication" $ do
    it "2 * 3 is equal to 6" $ do
      (mult 2 3) `shouldBe` 6
    it "3 * 4 is greater than 10" $ do
      (mult 3 4) > 10 `shouldBe` True
