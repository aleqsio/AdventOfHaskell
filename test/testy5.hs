import Test.HUnit
import Zad5

test1 = TestCase (assertEqual "solve" 342669 $ solve "input5.txt" )
testsZad7Spec = TestList [test1] 
