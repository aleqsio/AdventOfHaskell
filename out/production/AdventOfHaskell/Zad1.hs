module Zad1(solve,solve2) where

import Data.Char

solve :: [Char] -> Int
solve input = addUpIfNext $ map digitToInt input

addUpIfNext :: [Int]->Int
addUpIfNext list = snd $ foldr verify (head list, 0) (list)

verify::Int->(Int,Int)->(Int,Int)
verify val (last,sum) = (val,sum + if last==val then val else 0)

solve2 :: [Char] -> Int
solve2 input = addUpHalfWay $ map digitToInt input

addUpHalfWay :: [Int]->Int
addUpHalfWay list = snd $ foldl (verifyFromList list) (0, 0) (list)
verifyFromList::[Int]->(Int,Int)->Int->(Int,Int)
verifyFromList list (pos,sum) val  = (pos+1,sum + if list!!(((pos + quot ((length list)) 2) `mod` (length list)))==val then val else 0)