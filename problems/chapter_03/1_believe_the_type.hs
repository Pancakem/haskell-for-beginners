-- Guess the types of the following definitions.
-- Check your guesses in GHCI as you go.

a = 'a'
b = False
c = 100
d = 10.5
e = (100, "Pants")
f = ()
g = [ x*x | x <- [1..10] ]
h x = "Hello " ++ x
i x y = x ++ y ++ " Goodbye"
j x y = x:y ++ " Goodbye"

-- Add type signatures to the following function
-- definitions. If you can load the file into GHCI
-- without an error, then you have a valid signature!

-- add1 :: ???
add1 :: Int -> Int
add1 x = x + 1

hasThree :: [Int] -> Bool
hasThree ns = 3 `elem` ns

hasFoo :: [[Char]] -> Bool
hasFoo words = "foo" `elem` words

interject :: [Char] -> [Char] -> [Char]
interject before after = before ++ " - HEY! - " ++ after

isTwice :: Int -> Int -> Bool
isTwice x y = x == y * 2

numberThem :: [Char] -> [(Integer, Char)]
numberThem word = zip [1..] (word ++ " more")

-- Write functions for the following type signatures.
-- Try to guess what the function should do based
-- on the name and type signature.

area :: Double -> Double -> Double
area side1 side2 = side1 * side2

doubleThem :: [Int] -> [Int]
doubleThem xs = [x*2 | x <- xs]

numberOfMs :: String -> Int
numberOfMs str = length [ char | char <- str, char == 'm']

-- Write type signatures *and* definitions for the following
-- functions. Guess what they should do based on the name and parameters.
-- In some cases, more than one definition or signature might be acceptable.

removeVowels :: [Char] -> [Char]
removeVowels string = [x | x <- string, not (elem x "aeiouAEIOU")]

hypotenuse :: Float -> Float -> Float
hypotenuse a b = sqrt ((a*a) + (b*b))

makeRects :: [Float] -> [Float] -> [(Float, Float)]
makeRects lengths widths = zip lengths widths

