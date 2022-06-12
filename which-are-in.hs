
module Main where 

{-
Given two arrays of strings a1 and a2 return a sorted array r in lexicographical order of the strings of a1 which are substrings of strings of a2.

Example 1:
a1 = ["arp", "live", "strong"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns ["arp", "live", "strong"]

Example 2:
a1 = ["tarp", "mice", "bull"]

a2 = ["lively", "alive", "harp", "sharp", "armstrong"]

returns []

Notes:
Arrays are written in "general" notation. See "Your Test Cases" for examples in your language.
In Shell bash a1 and a2 are strings. The return is a string where words are separated by commas.
Beware: r must be without duplicates.
-}

{-
SHORTER SOLUTION

import Data.List

inArray :: [String] -> [String] -> [String]
inArray a1 a2 = nub . sort . filter (\s -> any (s `isInfixOf`) a2) $ a1
-}

import System.Environment

import Data.List(nub, sort)

getSubstringsOfSize :: String -> Int -> [String]
getSubstringsOfSize st sz  = fmap ($ st) ( map (\i -> (take sz . drop i ) )  [0..((length st)-sz)] )

isSubstring :: String -> String -> Bool
isSubstring s1 s2 = s1 `elem` (getSubstringsOfSize s2 (length s1))

inArray :: [String] -> [String] -> [String]
inArray a1 a2 = nub $ sort ( filter (\a -> any (\b -> isSubstring a b) a2 ) a1 )

main :: IO()
main = do
    print $ "AEHO"