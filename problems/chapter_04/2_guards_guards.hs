-- Write a function that compares two
-- pairs and determines the ordering of them
pairCompare :: Ord a => (a,a) -> (a,a) -> Ordering
pairCompare (x,y) (m,n)
    | x > m = GT
    | y > n = GT
    | x < m = LT
    | y < n =  LT
    | otherwise = EQ


-- Write a function that implements Fizz Buzz
-- (http://en.wikipedia.org/wiki/Fizz_buzz)
-- for all positive integers using guards.
--
--
fizzBuzz :: Int -> String
fizzBuzz x    
    | x `mod` 15 == 0 = "Fizz Buzz"
    | x `mod` 5 == 0 = "Buzz"
    | x `mod` 3 == 0 = "Fizz"
    | otherwise = show x