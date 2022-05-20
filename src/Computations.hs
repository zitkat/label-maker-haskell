module Computations (computeUnitPrice, ProcessedMed, unpackP) where

import Data

newtype ProcessedMed  = Processed {unpackP :: Med} deriving Show

computeUnitPrice :: Med -> ProcessedMed
computeUnitPrice m@Med{total_price=tp, 
                       total_amount=ta} = Processed $ m {unit_price=tp/fromIntegral ta}


-- unpackP :: ProcessedMed -> Med
-- unpackP (Processed med) = med