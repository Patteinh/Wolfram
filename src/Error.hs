{-
-- EPITECH PROJECT, 2023
-- Error.hs
-- File description:
-- Error
-}

module Error where

import Text.Read (readMaybe)

chosenOpt :: String -> [Maybe Int] -> Int -> [Maybe Int]
chosenOpt x xs i = take i xs ++ [readMaybe x] ++ drop (i+1) xs

-- ["--rule", "90", "--lines", "20"] [Nothing, Nothing, Nothing, Nothing, Nothing]
checkErrors :: [String] -> [Maybe Int] -> IO [Maybe Int]
checkErrors [] value = return value
checkErrors ("--rule":x:xs) value = checkErrors xs (chosenOpt x value 0)
checkErrors ("--start":x:xs) value = checkErrors xs (chosenOpt x value 1)
checkErrors ("--lines":x:xs) value = checkErrors xs (chosenOpt x value 2)
checkErrors ("--window":x:xs) value = checkErrors xs (chosenOpt x value 3)
checkErrors ("--move":x:xs) value = checkErrors xs (chosenOpt x value 4)
checkErrors _ _ = error "Invalid argument provided."
