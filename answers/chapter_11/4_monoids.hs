import Data.Monoid
import Data.List
import qualified Data.Foldable as F

-- Using Strings as a Monoid, define a function
-- that will join together a list of strings
-- with a given delimeter string in between.
--
joinS :: String -> [String] -> String
joinS _ [] = mempty
joinS _ [x] = x
joinS delim (x:xs) = x `mappend`
                    delim `mappend`
                    joinS delim xs

-- Using Strings as a Monoid and your
-- joinS function above,  define a function
-- equivalent to mconcat on strings.
--
concatS :: [String] -> String
concatS = joinS mempty


-- Generalize your joinS and concatS functions
-- to work for all Monoids.
--
joinM :: Monoid m => m -> [m] -> m
joinM _ [] = mempty
joinM _ [x] = x
joinM delim (x:xs) = x `mappend`
                    delim `mappend`
                    joinM delim xs

concatM :: Monoid m => [m] -> m
concatM = joinM mempty


-- This function defines an integer sequence called a
-- collatz sequence when provided with a starting number.
-- A "collatz n sequence" is the collatz sequence that
-- starts with the integer n.
--
collatz :: Integer -> [Integer]
collatz 1 = [1]
collatz n = n : collatz m
  where m = if even n
            then n `div` 2
            else n*3 + 1

-- Use concatM (or mconcat) to find the sum of the collatz 27 sequence
--
collatz27Sum = getSum . concatM . map Sum $ collatz 27

-- Use concatM (or mconcat) to find the product of the collatz 11 sequence
--
collatz11Product = getProduct . mconcat . map Product $ collatz 11

-- Use concatM (or mconcat) to find out whether any number in the
-- collatz 27 sequence is a multiple of 7
--
anyMultiplesOf7 = getAny . mconcat . map Any $ map (\x -> x `mod` 7 == 0) (collatz 27)


-- Use concatM (or mconcat) to find out whether all the collatz
-- sequences from collatz 1000 to collatz 2000 are no more than
-- 200 elements in length
--
shorterThan200 = getAll . mconcat . map All $
                 map ((<200) . length . collatz) [1000..2000]


-- Using the Ordering Monoid, define a function that sorts collatz sequences
-- with longest sequences first and sorts sequences that start with a smaller
-- number before others of the same length.
--
-- E.G. collatz 27 should come before collatz 11 because it is longer, but
-- collatz 12 comes before collatz 13 because 12 < 13 and collatz 12 and
-- collatz 13 are the same length.
--
collatzSort :: [Integer] -> [Integer] -> Ordering
collatzSort [] [] = EQ
collatzSort _ [] = GT
collatzSort [] _ = LT
collatzSort a@(a1:_) b@(b1:_) =
  (length b `compare` length a) `mappend`
  (a1 `compare` b1)

-- Use your collatz sorting function to sort the collatz 1 through collatz 30
--
sortedCollatz = sortBy collatzSort $ map collatz [1..30]


-- Use Maybe as a monoid to find the first number in a collatz sequence
-- (> 10000) (that is, the first number in the first collatz sequence
-- that is greater than 10000, starting with collatz 1).
--
firstBigOne = getFirst . mconcat . map First $
              map (find (>10000) . collatz) [1..]


-- Declare an instance of Foldable for the Graph
-- data type from earlier section by defining
-- foldMap
--
data Graph a = Node a [Graph a] deriving (Show, Eq)

instance F.Foldable Graph where
  foldMap f (Node a graphs) = f a `mappend`
                              (mconcat $ map (F.foldMap f) graphs)


graphUp = Node 1 [Node 2 [Node 3 [], Node 4 []], Node 5 []]

-- Show that foldl and foldr work correctly with your definition by
-- converting graphs to lists with (:)
--
leftProof = F.foldl (flip (:)) [] graphUp
rightProof = F.foldr (:) [] graphUp

-- Show your foldMap definition provides laziness when
-- using foldr by partially traversing the following graph
--
graphWithCycles = left
  where left = Node "Left" [right]
        right = Node "Right" [left]

lazyProof = take 10 $ F.foldr (:) [] graphWithCycles

