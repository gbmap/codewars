
module Main where

import Data.Char 

charToIndex :: Char -> Integer
charToIndex c
    -- (\x -> fst x == c)
    -- Is a lambda predicate that checks whether our char 'c'
    -- is equal to the char in the tuple (char, index) generated
    -- by zip "abc..." [1..]

    -- filter applies this lambda to the list of tuples and returns a list 
    -- containing only one item

    -- !! 0 then extracts the tuple from the returning list
    -- and `snd` gets the second item from the tuple
    | Data.Char.isLetter c = snd (filter (\x -> fst x == (Data.Char.toLower c)) mapCharToIndex !! 0)
    | otherwise = -1
        where mapCharToIndex = zip "abcdefghijklmnopqrstuvwxyz" [1..]

-- Filter applies the predicate a to very item in the list b,
-- and returns only the values for which the predicate is true.
removeNonLetters :: String -> String
-- removeNonLetters s = filter (\x -> 97 <= ord x && ord x <= 122 ) s
removeNonLetters s = filter (\x -> let ox = ord x in (97 <= ox && ox <= 122) || (65 <= ox && ox <= 90)) s

alphabetPosition :: String -> String
alphabetPosition s
    | length s == 0 = []
    | string == [] = []
    | otherwise = init $ concat $ indices
        where 
            string = concat $ indices
            lowercase = map (\x -> Data.Char.toLower x) s
            indices = map char_to_index_string (removeNonLetters lowercase)

            -- maps each char in string to its index
            -- then show $ casts it into string 
            -- then ++ " " appends the space to the end of the string
            char_to_index_string = (\x -> (show $ charToIndex x) ++ " ")

main :: IO()
main = print(alphabetPosition "\SYN") 
