module Zad1Spec(testsZad1Spec) where

import Test.HUnit
import Zad1

test1 = TestCase (assertEqual "for 1122" 3 $ solve "1122")
test2 = TestCase (assertEqual "for 1111" 4 $ solve "1111")
test3 = TestCase (assertEqual "for 1234" 0 $ solve "1234")
test4 = TestCase (assertEqual "for 1111" 4 $ solve "1111")




testsZad1Spec = TestList [test1,test2]