-- Add type declarations to the following definitions.
-- Try different declarations and see which ones GHCI
-- will accept as valid. Try to find the declaration
-- that will allow the definition to work for the most
-- types by using Type Classes.
increment :: (Num a) => a -> a
increment x = x + 1

removeAll :: (Eq a) => a -> [a] -> [a]
removeAll badX xs = [ x | x <- xs, x /= badX ]

sortPair :: (Ord a) => (a, a) -> (a, a)
sortPair pair = if (fst pair) <= (snd pair)
                then pair
                else (snd pair, fst pair)

one :: (Read a) => a
one = read "1"

-- Define pi in several different ways by converting the
-- string "3.14159" using the read function. Create
-- a float version, a double version, and a version
-- that will work for any readable type.
--
-- BONUS: Try to make the polymorphic safer by having
-- it fail with a type error rather than an exception
-- if a type that can't represent pi is requested.
floatPi :: Float
floatPi = read "3.14159"

doublePi :: Double
doublePi = read "3.14159"

polymorphicPi :: (Read a) => a
polymorphicPi = read "3.14159"

safePolymorphicPi :: (Floating a, Read a) => a
safePolymorphicPi = read "3.14159"

-- Define a function (with type declaration)
-- that will accept a value and produce a list
-- of the next three values in the series. It
-- should work for any type that supports the
-- succ function
nextThree :: (Enum a) => a -> [a]
nextThree val = [succ val, succ (succ val), succ (succ (succ val))]

-- Define a function (with type declaration)
-- that adds the square of two any numbers.
addSquare :: (Num a) => a -> a -> a
addSquare x y = x*x + y*y


-- Define a function (with type declaration)
-- that uses sqrt and your adding squares
-- function from above to calculate the
-- length of the hypotenuse of a triangle.
hypotenuse :: (Floating a) => a -> a -> a
hypotenuse sidea sideb = sqrt(addSquare sidea sideb)


-- Define a funtion (with type declaration)
-- and takes two values and returns a string
-- showing the values separated by ": ", as
-- if they were key and value in a dictionary.
dictLike :: (Show a) => a -> a -> String
dictLike m n = show m ++ ":" ++ show n

-- Define a polymorphic constant that will
-- give all the possible values of a type that
-- is both bounded and enumerable.
polymorphicConstant :: (Bounded a, Enum a) => a
polymorphicConstant = maxBound


-- BONUS: Define new versions of your squaring
-- and hypotenuse functions that allow the
-- parameters to be of *different* types. You can
-- assume the values are able to be converted to
-- integers.
integerAddSquare :: (Num a, Integral b, Integral c) => b -> c -> a
integerAddSquare x y = (fromIntegral x)*(fromIntegral x)+(fromIntegral y)*(fromIntegral y)

integerhypotenuse ::(Floating a, Integral b, Integral c) => b -> c -> a
integerhypotenuse x y = sqrt(integerAddSquare x y)