module Zad7Spec(testsZad7Spec) where

import Test.HUnit
import Zad24
import Zad24_2

test1 = TestCase (assertEqual "solve" "xegshds" $ solve "input7.txt")

testsZad7Spec = TestList [test1]