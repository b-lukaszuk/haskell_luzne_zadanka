type X = Double
type Y = Double

data Point = Point (X, Y) deriving (Show)

data Line = Line (Point, Point) deriving (Show)

-- https://www.youtube.com/watch?v=JSEPDJfl8m8
-- tangent theta = abs[(slope2-slope1)/1+slope2*slope1]
-- angleRad = tangent inverse of tangent theta

slope :: Line -> Double
slope (Line (Point (x1, y1), Point (x2, y2))) =
  let deltaY = y2 - y1
      deltaX = x2 - x1
  in deltaY / deltaX

tangentTheta :: Line -> Line -> Double
tangentTheta l1 l2 =
  let slope1 = slope l1
      slope2 = slope l2
      numerator = slope2 - slope1
      denominator = 1 + slope2 * slope1
  in abs $ numerator / denominator

-- returns angle in radians
angleRad :: Line -> Line -> Double
angleRad l1 l2 =
  let tanTheta = tangentTheta l1 l2
  in atan tanTheta

-- 1rad = 180deg/PI
radToDeg :: Double -> Double
radToDeg x = 180/pi * x

angleDeg :: Line -> Line -> Double
angleDeg l1 l2 = radToDeg $ angleRad l1 l2

p1 :: Point
p1 = Point (0, 1)

p2 :: Point
p2 = Point (1, 2)

p3 :: Point
p3 = Point (1.5, 3)

-- now we could use the angle to determine the turn of the line
-- assuming, e.g 0-90 right, -90-0 left, else Straight (NaN for Inifinite slope)
-- but that's enough for today, actually, I was only supposed to define
-- the type below
data Direction = Left | Right | Straight
