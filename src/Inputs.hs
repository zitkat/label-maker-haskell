module Inputs where

import Data
import GHC.IO.Handle ( hFlush )
import GHC.IO.Handle.FD ( stdout )
import Data.Maybe (listToMaybe, fromJust)


userInputMeds :: [Med] -> IO [Med]
userInputMeds meds = do
    med <- userInputMed
    putStrLn "Zadat další [A/n]?"
    next <- getLine
    if next == "n" 
        then return (med : meds)
        else userInputMeds (med : meds)

userInputMed :: IO Med
userInputMed = do 
    iname <- input "Zadejte jméno: "
    iform <- readInput "Zadejte lékovou formu: "
    iunit <- input "Zadejte jednotky: "
    itotal_amount <- readInput "Zadejte celkové množství: "
    itotal_price <- readInput "Zadejte celkovou cenu: "
    return Med {name = iname, 
                form = iform,
                unit = iunit,
                total_amount = itotal_amount,
                total_price = itotal_price,    
                unit_price = fromJust $ toNonNegative 0    
               }

input :: String -> IO String
input s = do 
    putStr s
    hFlush stdout
    getLine

readInput :: (Read a) => String -> IO a
readInput s = do
        line <- input s
        case readMaybe2 line of
            Just out -> return out
            Nothing -> readInput s 
        
-- | from https://stackoverflow.com/questions/8066850/why-doesnt-haskells-prelude-read-return-a-maybe
readMaybe :: (Read a) => String -> Maybe a
readMaybe s = case reads s of
                [(x, _)] -> Just x
                _ -> Nothing

readMaybe2 :: (Read a) => String -> Maybe a
readMaybe2 = fmap fst . listToMaybe . reads
