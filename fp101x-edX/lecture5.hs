{- Lecture 4
    - Part 1
-}

-- factorial using product
factorial :: Int -> Int
factorial n = product [1..n]

-- factorial (with recursion)
factorial' :: Int -> Int
factorial' 0 = 1
factorial' n = n * factorial' (n-1)

-- reverse (recursive)
reverse' :: [a] -> [a]
reverse' [] = []
reverse'  (x:xs) = reverse xs ++ [x]

-- product (recursive)
product' :: Num a => [a] -> a
product' [] = 1
product' (x:xs) = x * product' (xs)

zip' :: [a] -> [b] -> [(a, b)]
zip' [] _ = []
zip' _ [] = []
zip' (x:xs) (y:ys) = (x, y) : zip' xs ys

{- Lecture 4
    - Part 2
-}
-- quicksort (no optimizations)
qsort :: [Int] -> [Int]
qsort [] = []
qsort (x:xs) = qsort smaller ++ [x] ++ qsort larger
                where
                    smaller = [a | a <- xs, a <= x]
                    larger = [b | b <- xs, b > x]
