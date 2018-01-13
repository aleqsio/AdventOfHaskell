module Zad24(solve) where
import qualified Data.Text as T
import Debug.Trace
data Component = Component Int Int Int deriving (Show)

solve :: [Char] -> IO()
solve path = do
    input <- readFile path
    print $ solveText input

solveText :: [Char] -> Int
solveText input = recursive 0 $ map parseComponents [(i,(lines input)!!i) | i <- [0..(length $ lines input)-1]]

parseComponents :: (Int,[Char])->Component
parseComponents (id,desc) = Component (read $ T.unpack $ head ( T.splitOn (T.pack "/") (T.pack desc))) (read $ T.unpack $ last ( T.splitOn (T.pack "/") (T.pack desc))) id

hasPort :: Int->Component->Bool
hasPort port (Component a b id) = a==port || b==port

otherPort :: Component->Int->Int
otherPort (Component a b id) port = if(a==port) then b else a

recursive :: Int->[Component]->Int
recursive port remaining = maximumOrZero $ map (\x-> recursive (otherPort x port) (removeOne remaining x) + sumOfPorts x) (filter (hasPort port) remaining)

sumOfPorts::Component->Int
sumOfPorts (Component a b id)=a+b
removeOne :: [Component]->Component->[Component]
removeOne list (Component _ _ id2) = filter (\(Component a b id)->id/=id2) list

maximumOrZero :: [Int]->Int
maximumOrZero [] = 0
maximumOrZero list = maximum list