module Codewars.Kata.XO where

import Data.Char (toLower)
import Data.Map (toList, fromListWith)


-- BETTER SOLUTION
-- xo :: String -> Bool
-- xo str = count 'x' str == count 'o' str
--   where count char = length . filter ((==) char . toLower)

-- | Returns true if the number of
-- Xs is equal to the number of Os
-- (case-insensitive)
xo :: String -> Bool
xo str 
    | length s == 0 = True
    | length s > 1 = head s == last s
    | otherwise = False
    where s = ( map snd ) ( ( toList . fromListWith (+) ) [(toLower c,1) | c <- str, c `elem` "xoXO"] )