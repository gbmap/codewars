module Codewars.Kata.Convert where

digitize :: Int -> [Int]
digitize s = map (\x -> read [x] :: Int) (reverse $ show s)