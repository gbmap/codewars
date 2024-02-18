
-- This time no story, no theory. The examples below show you how to write function accum:

-- Examples:
-- accum("abcd") -> "A-Bb-Ccc-Dddd"
-- accum("RqaEzty") -> "R-Qq-Aaa-Eeee-Zzzzz-Tttttt-Yyyyyyy"
-- accum("cwAt") -> "C-Ww-Aaa-Tttt"
-- The parameter of accum is a string which includes only letters from a..z and A..Z.

{-
    Better solution.

    import Data.List
    import Data.Char

    accum :: [Char] -> [Char]
    accum s = intercalate "-" [ (toUpper c) : replicate i (toLower c) | c<-s | i<-[0..] ]
-}

module Main where

import System.Environment
import Data.Char

-- That's a lot. ):
accum :: [Char] -> [Char]
accum c = init . concat $ map (\(x:xs) -> (Data.Char.toUpper x):xs) $ reverse $ map (++"-") (foldl (\acc x -> (take (1+(length acc)) $ repeat x) : acc) [] $ map (\x -> Data.Char.toLower x) c)


run :: [String] -> [String]
run s = map accum s

main :: IO()
main = do
    args <- getArgs
    print $ accum $ (args !! 0)