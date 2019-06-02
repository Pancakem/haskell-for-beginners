-- Rewrite your implementation of reverse from earlier
-- using a case expression.
reverseList :: [a] -> [a]
reverseList list =
    case list of 
        [] ->
            []
        x:xs ->
            reverseList xs ++ [x]
        
-- Write a function to greet people based on their names.
-- The function should:
--    * Give some response for all names.
--    * Have a special greating for Bob
--    * Insult anyone who's name starts with Q
--    * Tell anyone with a name shorter than
--      3 characters to get a real name
--
-- BONUS: This is more convenient if you use a guard
--        *inside* your case experesion.

greeting :: String -> String
greeting name = case name of
        str ->
            if length str < 3 then "Get a real name" else if head str == 'Q' then "Fool" else "Hey " ++ str
            
        [] ->
            ""
       
            

