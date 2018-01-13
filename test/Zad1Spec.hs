module Zad1Spec(testsZad1Spec) where

import Test.HUnit
import Zad1

test1 = TestCase (assertEqual "for 1122" 3 $ solve "1122")
test2 = TestCase (assertEqual "for 1111" 4 $ solve "1111")
test3 = TestCase (assertEqual "for 1234" 0 $ solve "1234")
test4 = TestCase (assertEqual "for 1111" 4 $ solve "1111")

test21 = TestCase (assertEqual "for 1212" 6 $ solve2 "1212")
test22 = TestCase (assertEqual "for 1221" 0 $ solve2 "1221")
test23 = TestCase (assertEqual "for 123425" 4 $ solve2 "123425")
test24 = TestCase (assertEqual "for 123123" 12 $ solve2 "123123")

testsZad1Spec = TestList [test1,test2,test3,test4,test21,test22,test23,test24]