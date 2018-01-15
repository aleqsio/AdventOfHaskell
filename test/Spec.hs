import Zad1Spec
import Zad24Spec
import Zad7Spec
import Test.HUnit

allTests = testsZad1Spec ++ testsZad24Spec ++ testsZad7Spec

main :: IO Counts
main = runTestTT allTests
