data Cylinder = Cylinder {radius  :: Double
                         , height :: Double
                         } deriving (Show)


getVolume :: Cylinder -> Double
getVolume c = height c * pi * radius c^2

round' :: Double -> Integer -> Double
round' num precision = (fromIntegral . round $ num * f) / f
  where f = 10^precision

round2 :: Double -> Double
round2 num = round' num 2

getChangedCylinder :: Double -> Double -> Cylinder -> Cylinder
getChangedCylinder dr dh c = Cylinder (radius c + dr) $ height c + dh

getChangedCylinders :: Double -> Double -> [Cylinder] -> [Cylinder]
getChangedCylinders dr dh cs = map (getChangedCylinder dr dh) cs
-- or
-- getChangedCylinders dr dh    = map (getChangedCylinder dr dh)

getVolumeRatio :: Cylinder -> Cylinder -> Double
getVolumeRatio c1 c2 = getVolume c2 / getVolume c1

getVolumeRatios :: [Cylinder] -> [Cylinder] -> [Double]
getVolumeRatios cs1 cs2 = map round2 ratios
  where ratios = zipWith getVolumeRatio cs1 cs2

getRatiosAfterChange :: Double -> Double -> [Cylinder] -> [Double]
getRatiosAfterChange dr dh cs = map (*100) $ getVolumeRatios cs cs2
  where cs2 = getChangedCylinders dr dh cs

-- uncomment the appropriate part, then copy-paste into REPL

-- scenario 1
-- getRatiosAfterChange 1 0 $ map (flip Cylinder 5) [1..5]

-- scenario 2
-- getRatiosAfterChange 1 (negate 1) $ map (flip Cylinder 5) [1..5]

-- scenario 3
-- getRatiosAfterChange 1 (negate 2) $ map (flip Cylinder 5) [1..5]
