{-
1: String matrix to Matrix object -> Parser for matricies
2: Matrix object to row actions list ->  
3: row actions list to latex string -> Latex maker

links: https://stackoverflow.com/questions/8463642/implement-gauss-jordan-elimination-in-haskell
-}

module Parser where

import Helpers 
import Types
import Data.List (nub)

rowSplitter = '|'
colomnSplitter = ','
whiteSpace = ' '

{-
Matrix example: "1, 2, 3 | 4, 5, 6 | 7, 8, 9"
Is the matrix:
                        1 2 3
                        4 5 6
                        7 8 9
-}

-- | Gets a string of a nubmer, returns that number
stringToNumber :: String -> MatrixNumber
stringToNumber string = read string

-- | Gets comma seperated numbers, returns a list of numbers
rowParser :: String -> [MatrixNumber]
rowParser string = map (stringToNumber) $ splitOn colomnSplitter string

matrixParser :: String -> Matrix
matrixParser string = map (rowParser) $ splitOn rowSplitter string

isValid :: Matrix -> Bool
isValid = (==1) . length . nub . map length

finalMatrixParser:: String -> Maybe Matrix
finalMatrixParser = ensure isValid . matrixParser . filter (/=whiteSpace)

stdinParser :: IO (Maybe Matrix)
stdinParser = finalMatrixParser <$> getLine