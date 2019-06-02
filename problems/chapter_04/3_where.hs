-- Write a function to tell whether a triangle
-- is big or not. A triangle should be called
-- big if its hypoteneuse is longer than 10.
--    (be sure to use where to make your function
--     more readable)
bigTriangle :: Float -> Float -> Bool
bigTriangle length width = hypoteneuse > 10
    where hypoteneuse = sqrt (length*length + width*width)

-- Write a function that classifies rectangles
-- into at least 5 size categories based their
-- area. The pair given is the rectangle's length
-- and width.
rectSize :: (Integer, Integer) -> String
rectSize (l, w)
    | area < 5 = "Little rectangle"
    | area < 10 = "Small rectangle"
    | area < 15 = "Medium rectangle"
    | area < 20 = "Big rectangle"
    | otherwise = "Whoa!"
    where area = l*w

-- Write a function that constructs a rect from a
-- list of 2 elements, length and width. Assume
-- there will always be exactly 2 elements
-- in the list. Use your where and pattern
-- matching skills to write the most readable
-- function you can.
listToRect :: [Integer] -> (Integer, Integer)
listToRect [] = (0,0)
listToRect xs = (head xs, second)
    where second = head (drop 1 xs)

-- Write a function that calculates the area of
-- each rectangle in a list.
calcArea :: [(Integer, Integer)] -> [Integer]
calcArea xs = [ area rct | rct <- xs]
    where area (l,w) = l*w

