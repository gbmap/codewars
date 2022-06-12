module MultiplesOf3And5 where

-- Interesting solution
-- solution :: Integer -> Integer
-- solution n = sum $ nub $ [3,6..n-1] ++ [5,10..n-1]

solution :: Integer -> Integer
solution number = sum [x | x <- [1..number-1], x `mod` 3 == 0 || x `mod` 5 == 0]