module Codewars.Kata.TenMinuteWalk where

{-
You live in the city of Cartesia where all roads are laid out in a perfect grid. You arrived ten minutes too early to an appointment, so you decided to take the opportunity to go for a short walk. The city provides its citizens with a Walk Generating App on their phones -- everytime you press the button it sends you an array of one-letter strings representing directions to walk (eg. ['n', 's', 'w', 'e']). You always walk only a single block for each letter (direction) and you know it takes you one minute to traverse one city block, so create a function that will return true if the walk the app gives you will take you exactly ten minutes (you don't want to be early or late!) and will, of course, return you to your starting point. Return false otherwise.

Note: you will always receive a valid array containing a random assortment of direction letters ('n', 's', 'e', or 'w' only). It will never give you an empty array (that's not a walk, that's standing still!).
-}
import System.Environment


charToPos :: Char -> (Int, Int)
charToPos c 
    | c == 'n'  = ( 0,  1)
    | c == 's'  = ( 0, -1)
    | c == 'w'  = (-1,  0)
    | c == 'e'  = ( 1,  0)
    | otherwise = ( 0,  0)

sumPos :: (Int,Int) -> (Int, Int) -> (Int,Int)
sumPos (x1,y1) (x2,y2) = (x1+x2, y1+y2)

isValidWalk :: [Char] -> Bool
isValidWalk walk 
    | (length $ take 10 walk) /= 10 = foldl (\acc x -> sumPos acc x) (0,0) (map charToPos walk) == (0,0)
    | otherwise = False


main :: IO()
main = do
    args <- getArgs
    putStrLn $ show $ isValidWalk $ head args