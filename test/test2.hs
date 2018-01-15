import Test.HUnit
import Zad2


test1 = TestCase (assertEqual "solve" 18 $ solve2_1 "5 1 9 5\n 7 5 3\n 2 4 6 8")
test2 = TestCase (assertEqual "solve" 9 $ solve2_2 "5 9 2 8\n 9 4 7 3\n 3 8 6 5")

testsZad2 = TestList [test1,test2] 
