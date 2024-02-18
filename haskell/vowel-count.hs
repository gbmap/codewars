module Codewars.Kata.Vowel where

-- BETTER, with curried function
-- getCount :: String -> Int
-- getCount = length . filter (`elem` "aeiou")

getCount :: String -> Int
getCount s = length $ filter (\x -> x `elem` "aeiou") s