module Computations (computeUnitPrice, ProcessedMed, unpackP) where

import Data
import Data.Maybe (fromJust)

newtype ProcessedMed  = Processed {unpackP :: Med} deriving Show

computeUnitPrice :: Med -> ProcessedMed
computeUnitPrice m@Med{total_price=tp, 
                       total_amount=ta} = Processed $ m 
                            {unit_price=fromJust $ toNonNegative $ (fromNonNegative tp) / 
                                                   fromIntegral (fromNonNegative ta)}
