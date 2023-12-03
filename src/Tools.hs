{-
-- EPITECH PROJECT, 2023
-- Tools.hs
-- File description:
-- Tools
-}

module Tools where

import Text.Read (readMaybe)
import Rules

createMaybeIntList :: [String] -> [Maybe Int]
createMaybeIntList _ = [ readMaybe "-1",
                  readMaybe "0",
                  readMaybe "-100",
                  readMaybe "80",
                  readMaybe "0" ]

defaultArgs :: [Maybe Int]
defaultArgs = createMaybeIntList []

appendHeadToRes :: String -> String -> String
appendHeadToRes list b = head list : b

appendLineHeadToRes :: String -> String -> String -> (String, String, String)
appendLineHeadToRes a b c =
    let newIni = tail a
        newRes = appendHeadToRes c b
        newLine = tail c
    in (newIni, newRes, newLine)

appendIniHeadToRes :: String -> String -> (String, String)
appendIniHeadToRes a b =
    let newIni = tail a
        newRes = appendHeadToRes a b
    in (newIni, newRes)

-- [90, 0, 20, 0, 0]
setArgs :: [Maybe Int] -> [Int] -> Int -> IO [Int]
setArgs xs res 5 = return (reverse res)
setArgs xs res idx
    | Just n <- xs !! idx, (idx, n) == (0, 30)
    || (idx, n) == (0, 90) || (idx, n) == (0, 110) =
    setArgs xs (n : res) (idx + 1)
    | Just n <- xs !! idx, idx `elem` [1, 2, 3, 4], n >= 0 =
    setArgs xs (n : res) (idx + 1)
    | otherwise = setArgs xs (-1 : res) (idx + 1)

updtLine :: String -> String -> Int -> String
updtLine lastLine res rule
    | length l /= 3 = res
    | otherwise = updtLine (tail lastLine) (findRule rule l : res) rule
    where l = take 3 lastLine

startedIndex :: Int -> Int -> Int -> Int
startedIndex win seg move
    | (((mod (seg) 2) == 0) && ((mod win 2) /= 0)) =
    ((((div win 2) - (div seg 2) + 1)) + move)
    | otherwise = (((div win 2) - (div seg 2)) + move)

initList :: Int -> String -> String
initList 0 res = res
initList count res = initList (count - 1) (' ' : res)

concWith :: Int -> String -> String -> String -> Int -> Int -> Int -> String
concWith size ini res line actIdx sIdx eIdx
    | size <= actIdx = res
    | actIdx >= sIdx && actIdx < eIdx && not (null line) =
    let (newIni, newRes, newLine) = appendLineHeadToRes ini res line
    in concWith size newIni newRes newLine (actIdx + 1) sIdx eIdx
    | not (null ini) =
    let (newIni, newRes) = appendIniHeadToRes ini res
    in concWith size newIni newRes line (actIdx + 1) sIdx eIdx
    | otherwise = res

concWithin :: Int -> String -> String -> String -> Int -> Int -> Int -> String
concWithin size ini res line actIdx sIdx eIdx
    | size <= actIdx = res
    | actIdx < eIdx && not (null line) =
    let (newIni, newRes, newLine) = appendLineHeadToRes ini res line
    in concWithin size newIni newRes newLine (actIdx + 1) sIdx eIdx
    | not (null ini) =
    let (newIni, newRes) = appendIniHeadToRes ini res
    in concWithin size newIni newRes line (actIdx + 1) sIdx eIdx
    | otherwise = res

convFirstStr :: String -> Int -> String
convFirstStr start count
    | count + 1 >= 1 || null start = start
    | otherwise = convFirstStr (tail start) (count + 1)
