module Main where

import           Day1

printDay day x = putStr (day++": ") >> print x

main :: IO ()
main = do
  Day1.file >>= printDay "1" . Day1.solve
