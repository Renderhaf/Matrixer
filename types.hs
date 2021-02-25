module Types where

type MatrixNumber = Double
type Matrix = [[MatrixNumber]]

data RowOperation = Switch Int Int -- Switch row m1 and m2 
                  | Multiply Int MatrixNumber -- Multiply row m1 with scalar m2
                  | Add Int MatrixNumber Int -- Add row m1 multiplied by m2 to row m3