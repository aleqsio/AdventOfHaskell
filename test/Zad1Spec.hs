module Zad1Spec(testsZad1Spec) where

import Test.HUnit
import Zad1

test1 = TestCase (assertEqual "for 1212" 6 $ solve "1212")

testsZad1Spec = TestList [TestLabel "test1" test1, TestLabel "test2" test1]