module Zad7(solve,getName,solveText,Program(..),getLocks,getListOfLocks) where

import Data.List
import Debug.Trace
data Program = Program String [String] deriving (Show)

solve :: [Char] -> IO()
solve path = do
    input <- readFile path
    print $ solveText input

solveText :: [Char] -> String
solveText input = solvePrograms $ map parsePrograms (lines $ removeSeparator input)

solvePrograms:: [Program]->String
solvePrograms programs=head $ getListOfNames programs \\ getListOfLocks programs
--if(length programs == 1) then getName $ programs!!0 else solvePrograms $ removeNotSupporting programs

getListOfLocks :: [Program]->[String]
getListOfLocks programs = foldr (\prog acc ->acc++(getLocks prog)) [] programs

getListOfNames :: [Program]->[String]
getListOfNames programs = foldr (\prog acc ->acc++[(getName prog)]) [] programs

removeSeparator :: String->String
removeSeparator = filter (\c -> not $ c `elem` ['(',')',','])

getName ::Program->String
getName (Program name _) = name

getLocks ::Program->[String]
getLocks (Program _ locks) = locks

parsePrograms :: [Char]->Program
parsePrograms desc = Program (words desc!!0) (snd $ splitAt 3 (words desc))
