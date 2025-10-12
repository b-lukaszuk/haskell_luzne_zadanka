data Sphere = Sphere {radius :: Double} deriving (Show)

getVolume :: Sphere -> Double
getVolume s = (4/3) * pi * (radius s)^3

getSurfaceArea :: Sphere -> Double
getSurfaceArea s = 4 * pi * (radius s)^2

getSphere :: Double -> Sphere
getSphere volume = Sphere $ (volume/(4/3)/pi)**(1/3)

round' :: Double -> Integer -> Double
round' num precision = (fromIntegral . round $ num * f) / f
    where f = 10^precision

round2 :: Double -> Double
round2 num = round' num 2

refSphere = Sphere 10
nDrops = 1:[4,8..12]
totalVolumes = take (length nDrops) $ repeat $ getVolume refSphere
individualVolumes = zipWith (/) totalVolumes nDrops
spheres = map getSphere individualVolumes
individualSurfaceAreas = map getSurfaceArea spheres
totalSurfaceAreas = zipWith (*) individualSurfaceAreas nDrops

-- type any of the above variable names into the ghci (REPL)
-- to see their values, e.g.: map round2 totalSurfaceAreas
