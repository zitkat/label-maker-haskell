module Data where

import Data.Char (toLower)
import Data.String.Utils
import Data.String (IsString(fromString))


newtype NonNegative a = NonNegative a deriving Show

instance (Num a, Ord a, Read a) => Read (NonNegative a) where
    readsPrec _ s = case reads s of
                        [(x, _)] -> case toNonNegative x of 
                                         Just n -> wrapReads n
                                         _ -> []
                        _ -> []

toNonNegative :: (Num a, Ord a) => a -> Maybe (NonNegative a)
toNonNegative x
  | x < 0 = Nothing
  | otherwise = Just $ NonNegative x

fromNonNegative :: NonNegative a -> a
fromNonNegative (NonNegative x) = x



data DoseForm = GTT | SIR | KUS | TBL | INJ deriving (Show, Eq)

data Med = Med { name :: String
                ,form :: DoseForm
                ,unit :: String 
                ,total_amount :: NonNegative Int
                ,total_price :: NonNegative Double
                ,unit_price :: NonNegative Double
            } deriving Show

            

formFromString :: ReadS DoseForm
formFromString s = case strip $ map toLower s of
                        "gtt" -> wrapReads GTT
                        "sir"  -> wrapReads SIR
                        "kus" -> wrapReads KUS
                        "tbl" -> wrapReads TBL
                        "inj" -> wrapReads INJ
                        _     -> [] 


wrapReads :: a -> [(a, String)]
wrapReads x = [(x, "")]

instance Read DoseForm where
    readsPrec _ = formFromString
    

