-- Define a list of all Fibonacci numbers

fib :: Num a => [a]
fib = 0 : 1 : zipWith (+) fib (tail fib)

-- Implement a recursive function to find
-- the maximum element in a list of
-- pairs of elements.

maxPairElement :: Ord a => [(a,a)] -> a
maxPairElement [] = error "Emoty list"

maxPairElement [(x,y)]
    | x >= y = x
    | y >= x = y

maxPairElement ((x,y):xs) = max bigger (maxPairElement xs)
    where bigger = max x y

