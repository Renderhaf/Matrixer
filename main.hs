module Main where

import Types
import Solver
import Parser
import Helpers

main = print =<< ( applyRowOp (Add 0 1 2) <$$> stdinParser )