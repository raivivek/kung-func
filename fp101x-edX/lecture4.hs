{-
    - Functions discussed in Lecture 4. Notice how we gradually build up complex
    - abstractions after defining some very basic operations.
    - -}

import Data.Char (isLower)

--- zip
-- pairs of consecutive numbers
pairs :: [a] -> [(a,a)]
pairs xs = zip xs (tail xs)

-- check if list is sorted
sorted :: Ord a => [a] -> Bool
sorted xs = and [x <= y | (x,y) <- pairs xs]

-- find position of a number in list
positions :: Eq a => a -> [a] -> [Int]
positions x xs = [i | (x', i) <- zip xs [0..n], x == x']
                 where n = length xs - 1

--- string comprehensions
-- count number of lowercase
lowers :: String -> Int
lowers xs = length [x | x <- xs, isLower x]
