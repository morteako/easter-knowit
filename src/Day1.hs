module Day1 where

import           Data.List.Split (splitOn)
import           Data.Set        (Set)
import qualified Data.Set        as Set


solve :: String -> Set Int
solve = Set.difference (Set.fromList [1..100000]) . Set.fromList . map read . splitOn ","

dmain =
    readFile "data/day1.txt" >>= print . solve

file = readFile "data/day1.txt"


