{-

The goal of this exercise is to convert a string to a new string where 
each character in the new string is "(" if that character appears only once 
in the original string, or ")" if that character appears more than once 
in the original string. Ignore capitalization when determining if a character 
is a duplicate.

"din"      =>  "((("
"recede"   =>  "()()()"
"Success"  =>  ")())())"
"(( @"     =>  "))(("


WAY BETTER SOLUTION:

@solitude

module Dups where

import Data.Char

duplicateEncode :: String -> String
duplicateEncode xs = map encode xs' where
  xs' = map toLower xs 
  encode c = if length (filter (== c) xs') > 1 then ')' else '(' 

-}

module Dups where

import System.Environment
import Data.Char(toLower)
import Data.Map (fromListWith, lookup)
import Data.Maybe (fromJust)


duplicateEncode :: String -> String
duplicateEncode s = foldl (\acc c -> acc++(encode c)) "" ls -- n
    where ls = [toLower c | c <- s] -- n
          charMap = fromListWith (+) [(c,1) | c <- ls ] -- n
          encode c = ["()" !! min 1 ( (-) (fromJust $ Data.Map.lookup c charMap) 1 )] -- 1?

main :: IO()
main = do
    args <- getArgs
    putStrLn $ duplicateEncode $ head args

