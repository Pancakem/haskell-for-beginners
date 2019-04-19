-- Construct the word Gazump as a string in 4 different
-- ways and prove they are equal
gazump = "Gazump"
gazump' = ['G','a','z','u','m','p']
gazump'' = 'G':'a':'z':'u':'m':'p':[]
gazump''' = "Ga" ++ "za" ++ "ump"

-- Write a function that totals top 3 numbers in a
-- list (assuming the list is sorted with highest first)
top3sum :: [Int] -> Int 
top3sum lis = sum (take 3 lis)

-- Write a function to extract a portion of a string
-- based on position and length
substring len str indx = take len (drop indx str)

-- Write a function to tell if a list's length is > 4
-- (it should return a boolean)
longerthan4 lis = (length lis) > 4 

-- Write a function like the one above *without* referring
-- to the list's length
longerthan4' lis = not ( lis > (drop 4 lis))

-- Write safe versions of tail and init that return
-- empty list if the list is empty
tail' [] = []
tail' lis = tail lis 

init' [] = []
init' lis = init lis

-- Write safe versions of head and last that take a
-- default value to return if the list is empty
head' [] = []
head' lis = head lis

last' [] = []
last' lis = last lis

-- write a function to tell if either the sum or product
-- of a list is in another list
findSumorProduct lis1 lis2 = sum lis1 `elem` lis2 || product lis1 `elem` lis2 

-- write a function that reverses a section of a string
-- based on position and length. Use your substring function
-- from earlier to help.
reverseString len str indx = reverse (substring len str indx)