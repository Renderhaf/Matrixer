{-
1: String matrix to Matrix object -> Parser for matricies
2: Matrix object to row actions list ->  
3: row actions list to latex string -> Latex maker

links: https://stackoverflow.com/questions/8463642/implement-gauss-jordan-elimination-in-haskell
-}

module Main where

import Helpers 

rowSplitter = '|'
colomnSplitter = ','
whiteSpace = ' '

type MatrixNumber = Double
type Matrix = [[MatrixNumber]]

{-
Matrix example: "1, 2, 3 | 4, 5, 6 | 7, 8, 9"
Is the matrix:
                        1 2 3
                        4 5 6
                        7 8 9
-}

-- Gets a string of a nubmer, returns that number
stringToNumber :: String -> MatrixNumber
stringToNumber string = read string

-- Gets comma seperated numbers, returns a list of numbers
rowParser :: String -> [MatrixNumber]
rowParser string = map (stringToNumber) $ splitOn colomnSplitter string

matrixParser :: String -> Matrix
matrixParser string = map (rowParser) $ splitOn rowSplitter string

finalMatrixParser:: String -> Matrix
finalMatrixParser string = matrixParser $ (filter (/=whiteSpace) string)

stdinTest = (finalMatrixParser <$> getLine) >>= print