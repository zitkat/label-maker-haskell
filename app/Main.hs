module Main where

import Inputs (userInputMeds)
import Computations (computeUnitPrice)
import Renders ( showProcessedMed )

main :: IO ()
main = do
    meds <- userInputMeds [] 
    foldMap (putStr . showProcessedMed . computeUnitPrice) meds
