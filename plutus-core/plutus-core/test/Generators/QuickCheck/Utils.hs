{-# LANGUAGE TypeApplications #-}

module Generators.QuickCheck.Utils where

import PlutusPrelude

import PlutusCore.Data
import PlutusCore.Generators.QuickCheck.Builtin
import PlutusCore.Generators.QuickCheck.Utils

import Test.Tasty
import Test.Tasty.QuickCheck

-- | Test that both 'multiSplit1' and 'multiSplit0' produce a list such that 'concat'ing it gives
-- back the input.
test_multiSplitSound :: TestTree
test_multiSplitSound =
    testGroup "soundness" $ do
        (name, split) <-
            [ ("multiSplit1", coerce $ multiSplit1 @Int)
            , ("multiSplit0", multiSplit0 0.1)
            ]
        pure . testProperty name $ \(xs :: [Int]) ->
            withMaxSuccess 10000 . forAll (split xs) $ \aSplit ->
                xs === concat aSplit

-- | Show the distribution of lists generated by a split function for a list of the given length.
test_listDistribution :: Int -> ([()] -> Gen [[()]]) -> Int -> TestTree
test_listDistribution numRuns split n =
    testProperty ("for a list of length " ++ show n) $
        withMaxSuccess numRuns . forAll (split $ replicate n ()) $ \aSplit ->
            label (show $ map length aSplit) True

-- | Count the number of 'I' and 'B' nodes in a 'Data' object.
countIandBs :: Data -> Int
countIandBs = go 0 where
    go :: Int -> Data -> Int
    go acc (Constr _ ds) = foldl' go acc ds
    go acc (Map ps)      = foldl' (\acc' (d1, d2) -> go (go acc' d1) d2) acc ps
    go acc (List ds)     = foldl' go acc ds
    go acc (I _)         = acc + 1
    go acc (B _)         = acc + 1

-- | Test the number of 'I' and 'B' nodes in a 'Data' generated from a @spine :: [()]@ equals the
-- length of the spine. Ensures that the 'Data' generator is not exponential in 'B' and 'I' nodes
-- (exponentiality in other nodes will not get caught by this test).
test_arbitraryDataExpectedLeafs :: TestTree
test_arbitraryDataExpectedLeafs =
    testProperty "'arbitrary @Data' has the expected number of 'B' and 'I' leaves" $
        withMaxSuccess 1000 . mapSize (* 5) $ \spine ->
            forAll (genDataFromSpine spine) $ \dat ->
                countIandBs dat === length spine

test_multiSplitDistribution :: TestTree
test_multiSplitDistribution =
    testGroup "distribution of values generated by"
        [ testGroup "multiSplit1"
            [ test_listDistribution 10000 (coerce $ multiSplit1 @()) 1
            , test_listDistribution 10000 (coerce $ multiSplit1 @()) 2
            , test_listDistribution 10000 (coerce $ multiSplit1 @()) 3
            , test_listDistribution 10000 (coerce $ multiSplit1 @()) 4
            , test_listDistribution 10000 (coerce $ multiSplit1 @()) 5
            ]
        , testGroup "multiSplit0"
            [ test_listDistribution 1000 (multiSplit0 0.1) 1
            , test_listDistribution 1000 (multiSplit0 0.05) 2
            , test_listDistribution 1000 (multiSplit0 0.01) 3
            ]
        ]

test_utils :: TestTree
test_utils = testGroup "utils"
    [ test_arbitraryDataExpectedLeafs
    , test_multiSplitSound
    , test_multiSplitDistribution
    ]
