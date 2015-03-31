-- Practice for Quiz 3
-- FP101x

-- Exercise 2

{-False || False = False-}
{-_ || _ = True-}

{-b || False = b-}
{-_ || True = True-}

{-b || c-}
  {-| b == c = True-}
  {-| otherwise = False-}

-- Exercise 3
--
{-a && b == if not(a) then not(b) else True-}

-- Exercise 4

{-mult = \x -> (\y -> (\z -> x*y*z))-}

func :: Int -> Int
func x = x*3
