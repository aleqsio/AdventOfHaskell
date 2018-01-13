import Zad1Spec
import Test.HUnit

allTests = testsZad1Spec

main :: IO Counts
main = runTestTT allTests
