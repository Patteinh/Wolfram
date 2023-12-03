{-
-- EPITECH PROJECT, 2023
-- Display.hs
-- File description:
-- Display
-}

module Display where

import Tools

displayLine :: String -> Int -> Int -> IO ()
displayLine str w m
    | started < 1 = displayRev str w started
    | started < w = displayRightAl str w started
    | otherwise   = return ()
    where started = startedIndex w (length str) m

displayRev :: String -> Int -> Int -> IO ()
displayRev str w started = putStrLn $
    reverse $ concWithin w (initList w [])
    [] (convFirstStr str started) 0 started (started + length str)

displayRightAl :: String -> Int -> Int -> IO ()
displayRightAl str w started = putStrLn $
    reverse $ concWith w (initList w [])
    [] str 0 started (started + length str)

-- [90, 0, 20, 0, 0], c = 20, lstLine = "*", et l = 0
engineW :: [Int] -> Int -> String -> Int -> IO ()
engineW xs 0 lstLine l = return ()
engineW xs c lstLine l
    | l > 0 =
    let nwLine = reverse $ updtLine (' ' : ' ' : lstLine ++ "  ") [] (xs !! 0)
    in engineW xs c nwLine (l - 1)
    | otherwise =
    let nwLine = reverse $ updtLine (' ' : ' ' : lstLine ++ "  ") [] (xs !! 0)
    in displayLine lstLine (xs !! 3) (xs !! 4) >> engineW xs (c - 1) nwLine l
