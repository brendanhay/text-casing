{-# LANGUAGE OverloadedStrings #-}

-- Module      : Main
-- Copyright   : (c) 2014 Brendan Hay <brendan.g.hay@gmail.com>
-- License     : This Source Code Form is subject to the terms of
--               the Mozilla Public License, v. 2.0.
--               A copy of the MPL can be found in the LICENSE file or
--               you can obtain it at http://mozilla.org/MPL/2.0/.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : experimental
-- Portability : non-portable (GHC extensions)

module Main (main) where

import Data.Text        (Text, unpack)
import Data.Text.Case
import Test.Tasty
import Test.Tasty.HUnit

main :: IO ()
main = defaultMain $ testGroup "tests"
    [ test "lowerHead" lowerHead
        [ "SCREAMING_SNAKE" @: "sCREAMING_SNAKE"
        , "quiet snake."    @: "Quiet snake."
        ]

    , test "upperHead" upperHead
        [ "lorem Ipsum"  @: "Lorem Ipsum"
        , "Big kahoonas" @: "Big khaoonas"
        ]

    , test "toCamel" toCamel
        [ "PascalCased" @: "pascalCased"
        , "snake_cased_var" @: "snakeCasedVar"
        ]

    , test "toPascal" toPascal
        [
        ]

    , test "toSnake" toSnake
        [
        ]

    , test "toSpinal" toSpinal
        [
        ]

    , test "toTrain" toTrain
        [
        ]

    , test "toHuman" toHuman
        [
        ]

    , test "toHuman" toHuman
        [ "This is AOK"              @: "This is AOK"
        , "A-Slightly_Longer String" @: "A slightly longer string"
        ]
    ]

test :: TestName -> a -> [a -> TestTree] -> TestTree
test n f = testGroup n . map ($ f)

(@:) :: (Show a, Eq a) => Text -> a -> (Text -> a) -> TestTree
x @: y = \f -> testCase (unpack x) (y @=? f x)
