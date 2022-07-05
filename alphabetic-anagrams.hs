{-
We can then assign a number to every word, based on where it falls in an alphabetically sorted list of all words made up of the same group of letters. One way to do this would be to generate the entire list of words and find the desired one, but this would be slow if the word is long.

Given a word, return its number. Your function should be able to accept any word 25 letters or less in length (possibly with some letters repeated), and take no more than 500 milliseconds to run. To compare, when the solution code runs the 27 test cases in JS, it takes 101ms.

For very large words, you'll run into number precision issues in JS (if the word's position is greater than 2^53). For the JS tests with large positions, there's some leeway (.000000001%). If you feel like you're getting it right for the smaller ranks, and only failing by rounding on the larger, submit a couple more times and see if it takes.

Python, Java and Haskell have arbitrary integer precision, so you must be precise in those languages (unless someone corrects me).

C# is using a long, which may not have the best precision, but the tests are locked so we can't change it.

Sample words, with their rank:
ABAB = 2
AAAB = 1
BAAA = 4
QUESTION = 24572
BOOKKEEPER = 10743
-}

module Main where

import Data.List (sort, nub, permutations)
import Data.Map (Map, fromListWith, toList)

factorial :: (Integral a) => a -> a
factorial 0 = 1
factorial n = n * factorial (n-1)

-- combinations :: (Fractional a) => a -> a -> a
-- combinations n c = factorial n / ((factorial c) * factorial (n-c) )

nPermutations :: (Integral a) => a -> a
nPermutations nLetters = factorial ( nLetters-1 )

letterFrequency :: (Num a) => String -> Map Char a
letterFrequency s = fromListWith (+) [(c,1) | c <- s]

letterRepetitions :: String -> Integer
letterRepetitions s = product . map (factorial . snd) $ toList (letterFrequency s)

dictionaryLength :: String -> Float
dictionaryLength s = (fromIntegral . factorial . length $ s) / (fromIntegral . letterRepetitions $ s)

dictionaryLengthBruteForce :: String -> Integer
dictionaryLengthBruteForce s = toInteger $ length $ nub $ permutations s 

letterScore :: String -> Char -> Int
letterScore s c = 1 + length ( takeWhile (/= c) $ sort $ nub s)

bruteTest :: String -> [(String, Integer)]
bruteTest w = takeWhile (\(x,y) -> x /= w) (zip (sort $ nub $ permutations w) [1..])

-- BRUTEFORCE
-- lexiPos :: String -> Integer
-- lexiPos s = snd ((dropWhile (\(x,y) -> x /= s) (zip (sort $ nub $ permutations s) [1..])) !! 0)

-- lexiPos :: String -> Integer
-- lexiPos x = sum [ ls (x!!i)  * (score (drop i x)) |  i <- [0..length x] ]
--     where 
--         score subString = round(dictionaryLength $ sort subString)
--         ls l = toInteger(letterScore x l)

--  * round(dictionaryLength "UESTION")


main :: IO()
main = do
    print "AEHO"