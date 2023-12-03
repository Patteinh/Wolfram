{-
-- EPITECH PROJECT, 2023
-- Rules.hs
-- File description:
-- Rules
-}

module Rules where

rule30 :: String -> Char
rule30 xs = if xs `elem` ["*  ", " **", " * ", "  *"] then '*' else ' '

rule90 :: String -> Char
rule90 xs = if xs `elem` ["** ", "*  ", " **", "  *"] then '*' else ' '

rule110 :: String -> Char
rule110 xs = if xs `elem` ["** ", "* *", " **", " * ", "  *"] then '*' else ' '

findRule :: Int -> String -> Char
findRule 30 = rule30
findRule 90 = rule90
findRule 110 = rule110
findRule _ = const ' '
