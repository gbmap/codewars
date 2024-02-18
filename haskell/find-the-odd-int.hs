module Codewars.Kata.FindOdd where

import Data.Map(fromListWith, toList)

-- | Given a list, find the [Int] that appears an 
--   odd number of times. The tests will always
--   provide such a number, and the list will
--   always contain at least one element.
findOdd :: [Int] -> Int
findOdd xs = [ x | (x,y) <- toList(fromListWith (+) [(i,1) | i <- xs ]), mod 3 y == 0 ] !! 0