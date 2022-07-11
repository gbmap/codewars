module TextAlignJustify where

import Data.Map (fromList, (!))

merge :: [String] -> [String] -> [String]
merge xs [] = xs
merge [] ys = ys
merge (x:xs) (y:ys) = x : y : merge xs ys

extra_spaces :: Int -> Int -> [Int]
extra_spaces n e = zipWith (+) (replicate n d) ((replicate (e-(n*d)) 1) ++ (replicate (n-(e-(n*d))) 0))
    where d = div e n

justify :: String -> Int -> String
justify text width
    | length text > width = merge line spaces
    | otherwise = ""
    w = words text 
    l = map length w
    ll = tail scanl (+) 0 l
    lls = zip ll [0..]
    lw = takeWhile (\(x,y) -> x+y <= width) lls
    as = length lw - 1
    es = width - (last [x+y | (x,y) <- lw])
    spaces = map ((flip replicate) " ") (extra_spaces es)
    line = take (last lw) w





{- 
justify :: String -> Int -> String
justify [] _ = ""
justify text width 
    | length text >= width = y ++ "\n" ++ justify (drop (last ln) text) width
    | otherwise = text
    where w = words text
          wl = map length w
          wls = zipWith (+) wl (replicate (length wl) 1) ++ [0]
          ln = takeWhile (< width) (tail $ scanl (+) 0 wls)
          as = (length ln) - 1
          es = width - (last ln)
          sc = (map concat (map ((flip replicate) " ") (extra_spaces as es)))
          ws = take (length ln) w
          ww = (map (++ " ") (init ws) )++[last ws]
          y = concat (merge ww sc)
-}

{-
justify :: String -> Int -> String
justify text width 
    | length text > width = concat (merge ws sc) ++ "\n" ++ justify (drop d text) width
    | otherwise = text
    where w = words text
          wl = map (+1) (map length w)
          ln = takeWhile (<= width) (tail $ scanl (+) 0 wl)
          nw = length ln
          as = nw - 1
          es = width - (last ln)
          sc = (map concat (map ((flip replicate) " ") (map (+1) (extra_spaces as es))))
          ws = take nw w
          d = sum ln + (length ln) - 1 
-}