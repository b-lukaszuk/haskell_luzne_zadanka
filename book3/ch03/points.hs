type X = Double
type Y = Double

data Point = Point (X, Y)

instance Show Point where
  show (Point (x, y)) = "(" ++ show x ++ ", " ++ show y ++ ")"

--https://algorithmtutor.com/Computational-Geometry/Determining-if-two-consecutive-segments-turn-left-or-right/

p1 :: Point
p1 = Point (0, 1)

p2 :: Point
p2 = Point (1, 2)

p3 :: Point
p3 = Point (1, 3)

p4 :: Point
p4 = Point (4, 1)

p5 :: Point
p5 = Point (2, 1)

p6 :: Point
p6 = Point (2, 2)

p7 :: Point
p7 = Point (2, 3)

-- if crossProd is positive then p1 i clockwise from p2, with respect to (0, 0)
-- if crossProd is neg. then p1 i ccw from p2, with respect to (0, 0)
-- if crossProd is 0 then they are colinear (lie on a lingle line)
calcCrossProd :: Point -> Point -> Double
calcCrossProd (Point (x1, y1)) (Point (x2, y2)) = x1*y2 - x2*y1

ptsToVector :: Point -> Point -> Point
ptsToVector (Point (x1, y1)) (Point (x2, y2)) = (Point (x2-x1, y2-y1))

calcDirection :: Point -> Point -> Point -> Double
calcDirection pt1 pt2 pt3 =
  calcCrossProd (ptsToVector pt1 pt3) (ptsToVector pt1 pt2)

data Direction = DirLeft | DirRight | DirStraight deriving (Show)

getDirection :: Point -> Point -> Point -> Direction
getDirection pt1 pt2 pt3 =
  let dirVal = calcDirection pt1 pt2 pt3
  in if dirVal < 0 then DirLeft
  else if dirVal > 0 then DirRight
  else DirStraight

main :: IO()
main = do
  putStrLn "Testing directions between Points test points."
  putStrLn ""
  putStrLn $ "Direction: " ++ show p1 ++ ", " ++ show p2 ++ ", " ++ show p3
  putStrLn $ show $ getDirection p1 p2 p3
  putStrLn ""
  putStrLn $ "Direction: " ++ show p1 ++ ", " ++ show p2 ++ ", " ++ show p4
  putStrLn $ show $ getDirection p1 p2 p4
  putStrLn ""
  putStrLn $ "Direction: " ++ show p5 ++ ", " ++ show p6 ++ ", " ++ show p7
  putStrLn $ show $ getDirection p5 p6 p7
  putStrLn ""
  putStrLn "That's it. Goodbye!"
