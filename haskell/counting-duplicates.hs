
module Main where

import System.Environment
import Data.Char
import Data.List

duplicateCount :: String -> Int
duplicateCount ss = 
    let s = map Data.Char.toLower ss in length $ nub $ filter (\x -> length x > 1) $ map (\x -> filter (\y -> y==x) s ) s

-- BETTER SOLUTION
-- duplicateCount :: String -> Int
-- duplicateCount = length . filter ((> 1) . length) . group . sort . map toLower

-- No need to add the parameter name. You can just use function composition
-- and Haskell knows that to do.

-- Also, check group function from Data.List
-- https://downloads.haskell.org/~ghc/6.12.1/docs/html/libraries/base-4.2.0.0/Data-List.html#v:group
-- It does most of the work here.

-- Could use filter with (> 1) length instead of lambda.


main :: IO()
main = do
    args <- getArgs
    print $ duplicateCount (args !! 0)