module Data where

import Data.Char (toLower)
import Data.String.Utils


data DoseForm = GTT | ML | KUS | TBL | INJ deriving (Show, Eq)

data Med = Med { name :: String
                ,form :: DoseForm
                ,unit :: String 
                ,total_amount :: Int
                ,total_price :: Double
                ,unit_price :: Double
            } deriving Show

            

formFromString :: ReadS DoseForm
formFromString s = case strip $ map toLower s of
                        "gtt" -> wrapReads GTT
                        "ml"  -> wrapReads ML
                        "kus" -> wrapReads KUS
                        "tbl" -> wrapReads TBL
                        "inj" -> wrapReads INJ
                        _     -> [] 


wrapReads :: a -> [(a, String)]
wrapReads x = [(x, "")]

instance Read DoseForm where
    readsPrec _ = formFromString
    

