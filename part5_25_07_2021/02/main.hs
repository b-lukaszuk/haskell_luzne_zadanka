-------------------------------------------------------------------------------
--                                  task 2.1                                 --
-------------------------------------------------------------------------------
myElem :: (Eq a) => a -> [a] -> Bool
myElem _ [] = False
myElem y (x:xs) = if y == x then True else myElem y xs

-------------------------------------------------------------------------------
--                                  task 2.2                                 --
-------------------------------------------------------------------------------
nub :: (Eq a) => [a] -> [a]
nub [] = []
nub (x:xs) = if myElem x xs then nub xs else x : (nub xs)

-------------------------------------------------------------------------------
--                                  task 2.3                                 --
-------------------------------------------------------------------------------
isAsc :: [Int] -> Bool
isAsc [] = True
isAsc [x] = True
isAsc (x:y:xs) = if x < y then isAsc (y:xs) else False

-------------------------------------------------------------------------------
--                                  task 2.4                                 --
-------------------------------------------------------------------------------
graph :: [(Int, Int)]
graph = [(1, 2), (2, 3), (3, 2), (4, 3), (4, 5)]

hasPath :: [(Int, Int)] -> Int -> Int -> Bool
hasPath graph fromId toId =
  let firstQueue = getNeighboughrNodes graph fromId
  in hasPath' graph firstQueue toId

hasPath' :: [(Int, Int)] -> [(Int, Int)] -> Int -> Bool
hasPath' _ [] _ = False
hasPath' graph queue nodeId =
  let newQueue = getNewQueue queue graph
      newGraph = [node | node <- graph, node /= head queue]
  in (fst $ head queue) == nodeId || hasPath' newGraph newQueue nodeId

getNewQueue :: [(Int, Int)] -> [(Int, Int)] -> [(Int, Int)]
getNewQueue [] _ = []
getNewQueue oldQueue graph =
  let fstNode = head oldQueue
      fstNodeNeighbours = getNeighboughrNodes graph $ fst fstNode
  in tail oldQueue ++ fstNodeNeighbours

-- gets neighbours of nodeId (fst of Node) from graph
getNeighboughrNodes :: [(Int, Int)] -> Int -> [(Int, Int)]
getNeighboughrNodes graph nodeId =
  let neighbours = [b | (a, b) <- graph, a == nodeId]
      neighbourNodes = [(a, b) | (a, b) <- graph, myElem a neighbours]
  in neighbourNodes
