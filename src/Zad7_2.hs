{-
module Zad7_2(solve,getName,solveText,Program(..),getLocks,getListOfLocks) where

import Data.List
import Debug.Trace

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
    print $ solveText input

solveText :: [Char] -> String
solveText input = solvePrograms $ map parsePrograms (lines $ removeSeparator input)

solvePrograms:: [Program]->String
solvePrograms programs=traceShow ((getListOfNames programs) \\ (getListOfLocks programs)) $ head $ getListOfNames programs \\ getListOfLocks programs
--if(length programs == 1) then getName $ programs!!0 else solvePrograms $ removeNotSupporting programs

getListOfLocks :: [Program]->[String]
getListOfLocks programs = foldr (\prog acc ->acc++(getLocks prog)) [] programs

getListOfNames :: [Program]->[String]
getListOfNames programs = foldr (\prog acc ->acc++[(getName prog)]) [] programs

removeSeparator :: String->String
removeSeparator = filter (\c -> not $ c `elem` ['(',')',','])

getWeightOfProgram :: [Program]->String -> (String,Int)
getWeightOfProgram programs name = if(null $ getLocks . findProgramByName programs) then getWeightByName programs name else getWeightByName programs name + foldr (+) 0 getWeightByName programs $ getWeightsOfLocks programs name

compareWeightFromList :: [Program] -> (String,Int)
compareWeightFromList programs = ("",0)

getWeightByName :: [Program]->String->Int
getWeightByName programs = getWeight . (findProgramByName programs)

getWeightsOfLocks::[Program]->[String]->[Int]
getWeightsOfLocks programs name = map (getWeightByName programs) (getLocks $ findProgramByName programs name)

findProgramByName :: [Program]-> String -> Program
findProgramByName programs name = head $ filter (\x-> (getName x)== name) programs

parsePrograms :: [Char]->Program
parsePrograms desc = Program  (read $ words desc!!1) (words desc!!0) (snd $ splitAt 3 (words desc))
-}
