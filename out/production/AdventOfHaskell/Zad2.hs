module Zad2 (solve2_1,solve2_2) where

import Data.Char 
toLines :: String -> [String]
toLines stringFile = lines stringFile

wordsExtract :: String -> [[String]]
wordsExtract line = map words $ toLines line 

toIntConvert :: String -> [[Int]]
toIntConvert line = map (map strToInt) $ wordsExtract line

strToInt :: String -> Int
strToInt s = read s

diff :: [Int] -> Int
diff list = (maximum list) - (minimum list)

findDiffs :: String -> [Int]
findDiffs line = map diff $ toIntConvert line

solve2_1 :: String -> Int
solve2_1 line= sum $ findDiffs line

--part2
solve2_2 :: String -> Int
solve2_2 line= sum $ map evenlyDivisible $ toIntConvert line

evenlyDivisible :: [Int] -> Int
evenlyDivisible ns =maximum $ map (\(x,y) -> x`div`y) $ filter (\(x,y) -> x `mod`y == 0) [ (x, y) | x <- ns, y <- ns, x /= y ]




