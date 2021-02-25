module Solver where

import Types

-- | Gets a matrix, returns the row operation requiered to get the matrix
-- | one step forward in the gaussian elimination proccess
getClosestRowOp :: Matrix -> RowOperation
getClosestRowOp _ = undefined

-- | Takes a row operation and applies it to matrix
applyRowOp :: RowOperation -> Matrix -> Matrix
applyRowOp (Multiply a s) mat = before ++ [map (*s) (mat !! a)] ++ after 
    where before = take a mat
          after  = drop (a+1) mat

applyRowOp (Switch a b) mat =  before ++ [mat !! bigger] ++ between ++ [mat !! smaller] ++ after
    where bigger = max a b
          smaller = min a b
          before = take (smaller-1) mat
          after = drop (bigger+1) mat
          between = drop (smaller+1) $ take (bigger) mat
          
applyRowOp (Add a s c) mat = before ++ [newrow] ++ after
    where before = take c mat
          after  = drop (c+1) mat
          newrow = map (\t -> (fst t) + s * (snd t)) (zip (mat !! c) (mat !! a))

-- | Takes a matrix, returns the row operations required to get the matrix to
-- | row echlon form
solveMatrix :: Matrix -> [RowOperation]
solveMatrix mat = [currentOp] ++ solveMatrix (applyRowOp currentOp mat)
        where currentOp = getClosestRowOp mat