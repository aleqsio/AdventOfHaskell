module Zad22 where

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

checksum :: String -> Int
checksum line= sum $ findDiffs line

main :: IO ()
main = do
	input <-readFile "input2.txt"
	let sum = checksum input
	putStrLn $show $ sum

