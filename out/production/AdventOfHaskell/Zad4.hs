module Zad4(solve4_1,solve4_2) where
import Data.List

ifElem :: [String] -> Bool
ifElem (x:xs) = x `notElem` xs

checkAllElems :: [String] -> Bool
checkAllElems [] = True
checkAllElems (x:xs) = ifElem (x:xs) && checkAllElems xs

anagramInLine :: [String] -> Bool
anagramInLine list = True `notElem` containAnagram list

findTrues_1 :: String -> [Bool]
findTrues_1 line = map checkAllElems $ map words $ lines line 

solve4_1 :: String -> Int
solve4_1 line = countTrues $ findTrues_1 line

-- part2
isAnagram :: String -> String -> Bool
isAnagram x y = sort x == sort y

containAnagram :: [String] -> [Bool]
containAnagram (x:xs) = fmap (isAnagram x) xs

checkAllElems2 :: [String] -> Bool
checkAllElems2 [] = True
checkAllElems2 (x:xs) = ifElem (x:xs) && anagramInLine (x:xs) && checkAllElems2 xs

findTrues_2 :: String -> [Bool]
findTrues_2 line = map checkAllElems2 $ map words $ lines line


countTrues :: [Bool] -> Int
countTrues = loop 0
	where 
	      loop acc [] = acc
	      loop acc (False:xs) = loop acc xs
	      loop acc (True:xs) = loop (acc+1) xs


solve4_2 :: String -> Int
solve4_2 line = countTrues $ findTrues_2 line
