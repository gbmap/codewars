
module Main where

import System.Environment

findNextSquare :: Integer -> Integer
findNextSquare x 
  | (floor $ s) == (ceiling $ s) = (round $ s + 1)^2
  | otherwise = -1
  where s = sqrt $ fromIntegral x

main :: IO()
main = do
    args <- getArgs
    print $ findNextSquare $ (read (args !! 0) :: Integer)
