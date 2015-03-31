import Data.Char

riffle :: [a] -> [a] -> [a]
riffle xs ys = concat [[x,y] | (x, y) <- xs `zip` ys]

divides :: Int -> Int -> Bool
divides x n
    | x `mod` n == 0 = True
    | otherwise = False

{- Returns the divisors of a natural number. e.g., 
    - divisors 15 = [1, 3, 5, 15]
-}
divisors :: Int -> [Int]
divisors n = [x | x <- [1..n], n `divides` x]

-- Caeser cipher
let2int :: Char -> Int
let2int c
    | isLower c = ord c - ord 'a'
    | otherwise = ord c - ord 'A'

int2let :: Int -> Char
int2let n
    | n > 96 = chr (ord 'a' + n)
    | otherwise = chr (ord 'A' + n)

shift :: Int -> Char -> Char
shift n c
    | isLower c = int2let ((let2int c + n) `mod` 26)
    | otherwise = int2let ((let2int c + n) `mod` 26)

encode :: Int -> String -> String
encode n xs = [shift n x | x <- xs]
