module Zad4Spec(testsZad4Spec) where
import Test.HUnit
import Zad4


test1 = TestCase (assertEqual "solve" 2 $ solve4_1 "aa bb cc dd ee\n aa bb cc dd aa \n aa bb cc dd aaa")
test2 = TestCase (assertEqual "solve" 3 $ solve4_2 "abcde fghij \n abcde xyz ecdab  \na ab abc abd abf abj \niiii oiii ooii oooi oooo \n oiii ioii iioi iiio")

testsZad4Spec = [test1,test2]
