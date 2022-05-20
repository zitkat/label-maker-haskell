module Renders where

import Computations (ProcessedMed, unpackP)

showProcessedMed :: ProcessedMed -> String
showProcessedMed m = show um 
        where um = unpackP m