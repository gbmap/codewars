{-
We can then assign a number to every word, based on where it falls in an alphabetically 
sorted list of all words made up of the same group of letters. 

One way to do this would be to generate the entire list of words and 
find the desired one, but this would be slow if the word is long.

Given a word, return its number. Your function should be able to accept 
any word 25 letters or less in length (possibly with some letters repeated), 
and take no more than 500 milliseconds to run. To compare, 
when the solution code runs the 27 test cases in JS, it takes 101ms.

Sample words, with their rank:
ABAB = 2
AAAB = 1
BAAA = 4
QUESTION = 24572
BOOKKEEPER = 10743
-}

module Main where

import System.Environment
import Data.List (sort, nub)
import Data.Char(ord)

factorial :: Integer -> Integer
factorial 1 = 1
factorial n = n * factorial(n-1)

removeOne :: (Eq a) => a -> [a] -> [a]
removeOne _ [] = []
removeOne x (y:ys) = if x == y then ys else y : (removeOne x ys)

sub_words :: String -> [String]
sub_words s = [sort $ removeOne y s | y <- lesserCharacters s ]

lesserCharacters :: String -> [Char]
lesserCharacters w = sort . nub $ filter (\z -> (ord z) < (ord (w !! 0))) w

dict :: String -> Integer
dict w = let ww = nub w in 
    div (factorial $ toInteger $ length w) (product [factorial (occurrences c w) | c <- ww ])

occurrences :: Char -> String -> Integer
occurrences c w = sum [1 | a <- w, a == c]

rank :: String -> Integer
rank [] = 0
rank (x:xs) 
    | xs == [] = 1
    | otherwise = sum $ map (dict) (sub_words (x:xs))

lexiPos :: String -> Integer
lexiPos [] = 0
lexiPos (x:xs) = rank(x:(sort xs)) + lexiPos(xs)

main :: IO()
main = do
    print ([lexiPos w | w <- ["A",  "ABAB", "AAAB", "BAAA", "QUESTION", "BOOKKEEPER", "IMMUNOELECTROPHORETICALLY"]])