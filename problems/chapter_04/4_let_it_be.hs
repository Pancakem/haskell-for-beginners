-- Write a function to tell whether a triangle
-- is big or not. A triangle should be called
-- big if its hypoteneuse is longer than 10.
--    (be sure to use *let* to make your function
--     more readable)
bigTriangle :: Float -> Float -> Bool
bigTriangle length width = 
    let 
        hypoteneuse = sqrt (length*length + width*width)

        ret = hypoteneuse > 10
    in
    ret


-- Write a function that constructs a rect from a
-- list of 2 elements, length and width. Assume
-- there will always be exactly 2 elements
-- in the list. Use your *let* and pattern
-- matching skills to write the most readable
-- function you can.
listToRect :: [Integer] -> (Integer, Integer)
listToRect xs = 
    let
        [length, width] = xs
    in
    (length, width)


-- Write a function that calculates the area of
-- each rectangle in a list. Write two versions
-- of it, one with with let *outside* the list,
-- and one with let *inside* the list.
calcAreas :: [(Integer, Integer)] -> [Integer]
calcAreas xs = 
    let
        area (l,w) = l*w
    in
    [area rect | rect <- xs]

calcAreas' :: [(Integer, Integer)] -> [Integer]
calcAreas' xs = 
    [area rect | rect <- xs , let area (l,w) = l*w]

-- Write a function to calculate the area of a
-- square donut based on its size and thickness.
-- For instance, the square below has size 5,
-- thickness 1, area 16.
--
--                   █████
--                   █   █
--                   █   █
--                   █   █
--                   █████
--
donutArea :: Num a => a -> a -> a
donutArea size thickness = 
    let
        innersize = size - thickness*2
        innerarea = innersize*innersize
        outerarea = size*size
    in
    outerarea - innerarea

