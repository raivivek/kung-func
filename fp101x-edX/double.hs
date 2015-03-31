swap :: (Int, Int) -> (Int, Int)
swap (x, y) = (y, x)

add :: Int -> Int -> Int
add x y = x + y

pair x y = (x, y)

double x = x * 2

{-halve :: [a] -> ([a], [a])-}
{-halve xs = (take n xs, drop n xs)-}
    {-where n = length xs `div` 2-}

safetail :: [a] -> [a]
{-safetail-}
    {-= \xs ->-}
        {-case xs of-}
            {-[] -> []-}
            {-(_ : xs) -> xs-}
safetail xs = if null xs then [] else tail xs
