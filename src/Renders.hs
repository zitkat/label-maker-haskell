module Renders where

import Data
import Computations (ProcessedMed, unpackP)

showProcessedMed :: ProcessedMed -> String
showProcessedMed m = "Jméno:    " ++ name um ++ "\n" ++
                     "Forma:    " ++ show (form um) ++ "\n" ++
                     "Jednotky: " ++ unit um ++ "\n" ++
                     "Množství: " ++ show (total_amount um) ++ "\n" ++
                     "Cena:     " ++ show (total_price um) ++ "\n" ++
                     "Jdn. cena:" ++ show (unit_price um) ++ "\n\n"
        where um = unpackP m

