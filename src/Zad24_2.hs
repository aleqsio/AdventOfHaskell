module Zad24_2(solve2,solveText,hasPort,parseComponents,recursive,removeOne,Component(..),otherPort) where
import qualified Data.Text as T
import Data.List
import Debug.Trace
import Data.Ord
data Component = Component Int Int Int deriving (Show)

solve2 :: [Char] -> IO()
solve2 path = do
    input <- readFile path
    print $ solveText input

solveText :: [Char] -> Int
solveText input = snd $ recursive 0 $ map parseComponents [(i,(lines input)!!i) | i <- [0..(length $ lines input)-1]]

parseComponents :: (Int,[Char])->Component
parseComponents (id,desc) = Component (read $ T.unpack $ head ( T.splitOn (T.pack "/") (T.pack desc))) (read $ T.unpack $ last ( T.splitOn (T.pack "/") (T.pack desc))) id

hasPort :: Int->Component->Bool
hasPort port (Component a b id) = a==port || b==port

otherPort :: Component->Int->Int
otherPort (Component a b id) port = if(a==port) then b else a

recursive :: Int->[Component]->(Int,Int)
recursive port remaining = maximumOrZeroOfFirst $ map (\x-> addToTuple 1 (sumOfPorts x) $ recursive (otherPort x port) (removeOne remaining x)) (filter (hasPort port) remaining)

addToTuple::Int->Int->(Int,Int)->(Int,Int)
addToTuple a b (av,bv)=(av+a,bv+b)

sumOfPorts::Component->Int
sumOfPorts (Component a b id)=a+b
removeOne :: [Component]->Component->[Component]
removeOne list (Component _ _ id2) = filter (\(Component a b id)->id/=id2) list

maximumOrZeroOfFirst :: [(Int,Int)]->(Int,Int)
maximumOrZeroOfFirst [] = (0,0)
maximumOrZeroOfFirst list = maximumBy (comparing snd) (filter (\(x,y)->x==(fst $ maximumBy (comparing fst) list)) list)