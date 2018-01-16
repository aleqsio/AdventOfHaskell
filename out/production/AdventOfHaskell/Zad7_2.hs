module Zad7_2(solve,solveText2) where

import Data.List
import Debug.Trace
import Data.Ord
import Data.Function (on)
data Program = Program Int String [String] deriving (Show)

getName ::Program->String
getName (Program _ name _) = name

getLocks ::Program->[String]
getLocks (Program _ _ locks) = locks

getWeight :: Program->Int
getWeight (Program weight _ _) = weight


solve :: [Char] -> IO()
solve path = do
    input <- readFile path
    print $ solveText2 input

solveText2 :: [Char] -> String
solveText2 input = solvePrograms $ map parsePrograms (lines $ removeSeparator input)

solvePrograms:: [Program]->String
solvePrograms programs=prepare programs $ findOffender programs (head $ getListOfNames programs \\ getListOfLocks programs)

findOffender::[Program]->String->(String,Int)
findOffender programs program= tryOffender programs $ notEqual $ map (\k->(k,(getWeightWithChildren programs k))) (getLocks $ findProgramByName programs program)

getListOfLocks :: [Program]->[String]
getListOfLocks programs = foldr (\prog acc ->acc++(getLocks prog)) [] programs

tryOffender ::  [Program]->(String,Int)->(String,Int)
tryOffender programs (program,weightdiff) =if (alleq $ map (getWeightWithChildren programs) (getLocks $ findProgramByName programs program)) then (program,weightdiff) else findOffender programs program

prepare :: [Program]->(String,Int)->String
prepare programs (a,b)= traceShow (a,b) $ traceShow (getWeightByName programs a) $ show((getWeightByName programs a)-b)

getListOfNames :: [Program]->[String]
getListOfNames programs = foldr (\prog acc ->acc++[(getName prog)]) [] programs

removeSeparator :: String->String
removeSeparator = filter (\c -> not $ c `elem` ['(',')',','])

getWeightWithChildren :: [Program]->String->Int
getWeightWithChildren programs name = (getWeightByName programs name) + (foldr (+) 0 $ map (getWeightWithChildren programs) (getLocks $ findProgramByName programs name))

compareWeightFromList :: [Program] -> (String,Int)
compareWeightFromList programs = ("",0)

getWeightByName :: [Program]->String->Int
getWeightByName programs = getWeight . (findProgramByName programs)

getWeightsOfLocks::[Program]->String->[Int]
getWeightsOfLocks programs name = map (getWeightByName programs) (getLocks $ findProgramByName programs name)

findProgramByName :: [Program]-> String -> Program
findProgramByName programs name = head $ filter (\x-> (getName x)== name) programs

parsePrograms :: [Char]->Program
parsePrograms desc = Program  (read $ words desc!!1) (words desc!!0) (snd $ splitAt 3 (words desc))

alleq :: (Ord a,Eq a) => [a] -> Bool
alleq list = (length . group . sort $ list)==1

notEqual :: (Show a,Show b,Ord a,Eq a,Num a) => [(b,a)]->(b,a)
notEqual list = traceShow list $ (fst $ head $ minimumBy (comparing length) . groupBy ((==) `on` snd) . sortBy (comparing snd) $ list,(snd $ head $ minimumBy (comparing length) . groupBy ((==) `on` snd) . sortBy (comparing snd) $ list) - (snd $ head $ maximumBy (comparing length) . groupBy ((==) `on` snd) . sortBy (comparing snd) $ list))