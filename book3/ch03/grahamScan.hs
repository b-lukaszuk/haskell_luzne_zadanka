import Data.List (sortBy)

type X = Double
type Y = Double

data Point = Point X Y deriving (Eq)

instance Show Point where
  show (Point x y) = "(" ++ show x ++ ", " ++ show y ++ ")"

p1 :: Point
p1 = Point 0 1

p2 :: Point
p2 = Point 1 2

p3 :: Point
p3 = Point 1 3

p4 :: Point
p4 = Point 4 1

p5 :: Point
p5 = Point 2 1

p6 :: Point
p6 = Point 2 2

p7 :: Point
p7 = Point 2 3

points :: [Point]
points = [p1, p2, p3, p4, p5, p6, p7]

getAngleRadians :: Point -> Point -> Double
getAngleRadians (Point x1 y1) (Point x2 y2) = atan2 (y2 - y1) (x2 - x1)

ptsCompare :: Point -> Point -> Point -> Ordering
ptsCompare p p1 p2 =
  let angle1 = getAngleRadians p p1
      angle2 = getAngleRadians p p2
  in compare angle1 angle2

ptsCompareWithP :: Point -> Point -> Ordering
ptsCompareWithP = ptsCompare $ minimumYthenX points

minX :: Point -> Point -> Point
minX (Point x1 y1) (Point x2 y2) =
  if x1 < x2 then (Point x1 y1) else (Point x2 y2)

minYthenX :: Point -> Point -> Point
minYthenX (Point x1 y1) (Point x2 y2) =
  if y1 == y2 then minX (Point x1 y1) (Point x2 y2)
  else if y1 < y2 then (Point x1 y1) else (Point x2 y2)

minimumYthenX :: [Point] -> Point
minimumYthenX pts = foldl1 (\acc curVal -> minYthenX acc curVal) pts

sortedRemPts :: [Point] -> [Point]
sortedRemPts pts =
  let ptP = minimumYthenX pts
      ptsWithoutP = filter (\p -> p /= ptP) pts
  in sortBy ptsCompareWithP ptsWithoutP
