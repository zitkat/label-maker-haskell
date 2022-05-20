module Main where

import Inputs (userInputMeds)
import Computations (computeUnitPrice)

main :: IO ()
main = do
    meds <- userInputMeds []
    print $ map computeUnitPrice meds
