-- Write a function that implements Fizz Buzz
-- (http://en.wikipedia.org/wiki/Fizz_buzz)
-- up to the number 15 with simple pattern matching.
-- After 15, give up and lose the game.
fizzBuzzLose :: Integer -> String
fizzBuzzLose 1 = "1"
fizzBuzzLose 2 = "2"
fizzBuzzLose 3 = "Fizz"
fizzBuzzLose 4 = "4"
fizzBuzzLose 5 = "Buzz"
fizzBuzzLose 6 = "Fizz"
fizzBuzzLose 7 = "7"
fizzBuzzLose 8 = "8"
fizzBuzzLose 9 = "Fizz"
fizzBuzzLose 10 = "Buzz"
fizzBuzzLose 11 = "11"
fizzBuzzLose 12 = "Fizz"
fizzBuzzLose 13 = "13"
fizzBuzzLose 14 = "14"
fizzBuzzLose 15 = "Fizz Buzz"


-- Write two functions to calculate the 2 and 3 dimensional
-- dot product using tuples and pattern matching:
--   http://en.wikipedia.org/wiki/Dot_product#Algebraic_definition
dotProduct2 :: Num a => (a,a) -> (a,a) -> a
dotProduct2 (x,y) (p,q)= x*p + y*q 

-- dotProduct3 :: Num a => (a,a) -> (a,a) -> (a,a)-> a
-- dotProduct3 (x,y) (p,q) (m,n) = x*p + y*q + m*n 
-- haha 3 dimensions 
dotProduct3 :: Num a => (a,a,a) -> (a,a,a)-> a
dotProduct3 (x,y,z) (p,q,r) = x*p + y*q + z*r


-- Write a function to flip the components of all the pairs in
-- a list.
flipAll :: [(a,b)] -> [(b,a)]
flipAll pairs = [(q,p) | (p,q) <- pairs]

-- Write a function that moves the first element of a list to the end.
toEnd :: [a] -> [a]
toEnd [] = []
-- toEnd xs = (drop 1 xs) ++ [head xs]
toEnd (x:xs) = xs ++ [x]


-- Write your own implementation of reverse to reverse a list
--   (your function will probably need to call itself)
reverseList :: [a] -> [a]
reverseList [] = []
reverseList (x:xs) =  reverseList xs ++ [x]


-- Write a function to tell if a list's length is > 4.
-- Use only pattern matching to get the answer.

listGreaterThan4 :: [a] -> Bool
listGreaterThan4 [] = False
listGreaterThan4 [_] = False
listGreaterThan4 [_,_] = False
listGreaterThan4 [_,_,_] = False
listGreaterThan4 [_,_,_,_] = False
listGreaterThan4 _ = True


-- Write a function that pairs up each member of a list with
-- the one after it. For the list [1,2,3] the function should
-- return the list [(1,2),(2,3)]. (@ can help you here)
pairsGenerator :: [a] -> [(a,a)]
pairsGenerator [] = []
pairsGenerator xs@(_:tails) = zip xs tails 
