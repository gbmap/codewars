module CamelCase where

import System.Environment
import Data.Char (toUpper)

-- For some reason the expected result is that f("_") -> ""

{- Solution 3 -}

capitalize :: [Char] -> [Char]
capitalize [] = []
capitalize (x:xs) = [toUpper x]++xs

toCamelCase :: [Char] -> [Char]
toCamelCase [] = []
toCamelCase (x:xs)
    | x `elem` "-_" = toCamelCase $ capitalize xs
    | otherwise = x : toCamelCase xs


main :: IO()
main = do
    args <- getArgs
    putStrLn $ toCamelCase $ head args

