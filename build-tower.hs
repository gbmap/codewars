{-

Build a pyramid-shaped tower given a positive integer number of floors. A tower block is represented with "*" character.

For example, a tower with 3 floors looks like this:

[
  "  *  ",
  " *** ", 
  "*****"
]
And a tower with 6 floors looks like this:

[
  "     *     ", 
  "    ***    ", 
  "   *****   ", 
  "  *******  ", 
  " ********* ", 
  "***********"
] 

-}

module Codewars.BuildTower where

buildTower :: Int -> [String]
buildTower n = [ empties i ++ asterisk i ++ empties i | i <- take n [1,3..] ]
    where empties i = take (div (last seed - i) 2) (repeat ' ')
          asterisk i = take i (repeat '*')
          seed = take n [1,3..]
