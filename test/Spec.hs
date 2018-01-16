import Zad1Spec
import Zad24Spec
import Zad7Spec

import Zad2Spec
import Zad4Spec
import Zad5Spec
import Test.HUnit

allTests = testsZad1Spec ++ testsZad24Spec ++ testsZad7Spec ++ testsZad2Spec ++ testsZad4Spec ++ testsZad5Spec
main :: IO Counts
main = runTestTT $ TestList allTests
