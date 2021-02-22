module Helpers where

import Data.List (elemIndex)

-- Gets a delimiter and a list, and returns a list of lists
splitOn :: (Eq a) => a -> [a] -> [[a]]
splitOn delim lst = case delim `elemIndex` lst of
    Just n -> element : splitOn delim (drop 1 rest)
      where (element, rest) = splitAt n lst
    Nothing -> lst : []