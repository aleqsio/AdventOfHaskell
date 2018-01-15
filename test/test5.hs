import Test.HUnit
import Zad5

--test1 = TestCase (assertEqual "solve" 342669 $ sol )
--testsZad7Spec = TestList [test1] 

test1 = TestCase (assertEqual "solve" 5 $ solve5_1 [0,3,0,1,-3])
test2 = TestCase (assertEqual "solve" 10 $ solve5_2 [0,3,0,1,-3])
testsZad5 = TestList [test1,test2] 

