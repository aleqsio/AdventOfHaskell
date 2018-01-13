module Zad24Spec(testsZad24Spec) where

import Test.HUnit
import Zad24
import Zad24_2

test1 = TestCase (assertEqual "solve" 1940 $ solve "input24.txt")
test2 = TestCase (assertEqual "solve2" 1928 $ solve2 "input24.txt")

testsZad24Spec = TestList [test1,test2]