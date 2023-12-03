{-
-- EPITECH PROJECT, 2023
-- Main.hs
-- File description:
-- Main
-}

module Main where

import System.Exit
import Data.Maybe (listToMaybe, mapMaybe)
import System.Environment (getArgs)
import Text.Read (readMaybe)
import Data.Maybe (fromMaybe)
import Data.Maybe (mapMaybe)
import Control.Monad (when)

import Display
import Tools
import Error
import Rules

runWolfram :: [Int] -> IO ()
runWolfram args =
    let a:b:c:d:e:_ = args
    in engineW args c "*" b >> exitSuccess

-- /wolfram --rule 90 --lines 20
main :: IO ()
main = do
    args <- getArgs
    let nArgs = length args
    when (null args || odd nArgs) $ exitWith (ExitFailure 84)
    ret <- checkErrors args defaultArgs
    stockArgs <- setArgs ret [] 0
    when (any (== -1) stockArgs) $ exitWith (ExitFailure 84)
    runWolfram stockArgs
