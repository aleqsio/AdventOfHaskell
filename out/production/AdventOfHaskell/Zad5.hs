module Zad5(solve,solve5_1, solve5_2,conv) where

import Data.Char
import Data.List
import qualified Data.Sequence 


toLines :: String -> [String]
toLines stringFile = lines stringFile

stringToInt :: String -> Int
stringToInt a = read a

conv :: String -> [Int]
conv list = map (stringToInt) $ toLines list

listUpdate :: [Int] -> Int ->Int -> [Int]
listUpdate [] _ _ 	     = []
listUpdate list offset value | length part2 == 0 = [] --koniec listy
			     | otherwise         = part1++ [value]++ tail part2

			where
				(part1,part2) = splitAt offset list


jumpThrough_1 :: [Int] -> Int -> Int -> Int
jumpThrough_1 list currentOffset jumps | currentOffset + jumpLenght >= length list = (jumps+1)
			               | otherwise = jumpThrough_1 (listUpdate list currentOffset new_jumpLenght) (currentOffset + jumpLenght) (jumps+1)
	where jumpLenght    = list !! currentOffset
	      new_jumpLenght = jumpLenght + 1

jumpThrough_2 :: [Int] -> Int
jumpThrough_2 list =
  length $ takeWhile withIn $ iterate jump (Data.Sequence.fromList list, 0)
  where
    withIn (listSeq, offset) = offset >= 0 && offset < Data.Sequence.length listSeq
    jump (listSeq, offset) = (listUpdate, newOffset)
     where
	offsetModifier x | x>= 3 = x - 1
		         | otherwise = x + 1
        newOffset = offset + jumpBy
        listUpdate = Data.Sequence.update offset (offsetModifier jumpBy) listSeq
        jumpBy = Data.Sequence.index listSeq offset

solve5_1 :: [Int] -> Int
solve5_1 list = jumpThrough_1 list 0 0

solve5_2 :: [Int] -> Int
solve5_2 list = jumpThrough_2 list 


solve :: [Char] -> IO()
solve path = do
        input <- readFile path
       	print $ solve5_1 $ conv input	



