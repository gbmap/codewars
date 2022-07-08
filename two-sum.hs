


import Data.List(elemIndex)
import Data.Maybe(fromJust)


-- twoSumRecursive :: [Int] -> Int -> Int -> (Int, Int)
-- twoSumRecursive [] _ _ = error "No solution"
-- twoSumRecursive (x:xs) y i
--     | (length f) > 0 = (i, (fromJust $ (elemIndex (head f) xs))+i+1) 
--     | otherwise = twoSumRecursive xs y (i + 1)
--     where f = filter (\a -> x + a == y) xs


-- twoSum :: [Int] -> Int -> (Int, Int)
-- twoSum [] _ = (-1, -1)
-- twoSum x y = twoSumRecursive x y 0

twoSum :: [Int] -> Int -> (Int, Int)
twoSum x y = [(a,b) | a <- l, b <- l, a /= b, x!!a+x!!b==y] !! 0
    where l = [0..((length x)-1)]



    