import Data.Time

data DatabaseItem = DbString String | DbNumber Integer | DbDate UTCTime
  deriving (Eq, Ord, Show)

theDatabase :: [DatabaseItem]

theDatabase = [ DbDate (UTCTime (fromGregorian 1911 5 1) (secondsToDiffTime 34123))
              , DbNumber 9001
              , DbString "Hello, world!"
              , DbNumber 1
              , DbDate (UTCTime (fromGregorian 1921 5 1) (secondsToDiffTime 34123))]


-- case 1
getUTCTime :: DatabaseItem -> [UTCTime] -> [UTCTime]
getUTCTime (DbDate utcTime) acc = utcTime : acc
getUTCTime _ acc = acc

filterDbDate :: [DatabaseItem] -> [UTCTime]
filterDbDate db = foldr getUTCTime [] db


-- case 2
getDbNumber :: DatabaseItem -> [Integer] -> [Integer]
getDbNumber (DbNumber number) acc = number : acc
getDbNumber _ acc = acc

filterDbNumber :: [DatabaseItem] -> [Integer]
filterDbNumber db = foldr getDbNumber [] db


-- case 3
-- small improvement, Maybe UTCTTime accounts for possible failure in our search
mostRecent :: [DatabaseItem] -> Maybe UTCTime
mostRecent db = let dates = filterDbDate db
                in case dates of
                     (x:xs) -> Just $ foldr min x xs
                     [] -> Nothing


-- case 4
sumDb :: [DatabaseItem] -> Integer
sumDb db = let dbNums = filterDbNumber db
           in sum dbNums


-- case 5
avgDb :: [DatabaseItem] -> Double
avgDb db = let dbNums = filterDbNumber db
               sumOfNums = fromIntegral $ sum dbNums
               noOfNums = fromIntegral $ length dbNums
               avg = sumOfNums / noOfNums
           in avg
