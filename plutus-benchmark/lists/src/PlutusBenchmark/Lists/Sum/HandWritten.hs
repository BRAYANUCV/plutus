{-# LANGUAGE TypeApplications #-}

module PlutusBenchmark.Lists.Sum.HandWritten where

import PlutusBenchmark.Common (Term, compiledCodeToTerm)

import Control.Monad.Except
import Data.Either
import PlutusCore.StdLib.Data.List qualified as BuiltinList
import PlutusCore.StdLib.Data.ScottList qualified as ScottList
import PlutusTx qualified as Tx
import PlutusTx.Builtins.Internal qualified as BI
import UntypedPlutusCore qualified as UPLC


---------------- Hand-written folds, using stuff from PlutusCore.StdLib.Data  ----------------

mkBuiltinList :: [Integer] -> Term
mkBuiltinList l = compiledCodeToTerm (Tx.liftCode $ BI.BuiltinList l)

mkSumLeftBuiltinTerm :: [Integer] -> Term
mkSumLeftBuiltinTerm l = UPLC.Apply () (debruijnTermUnsafe $ UPLC.erase BuiltinList.sum) (mkBuiltinList l)

mkSumRightBuiltinTerm :: [Integer] -> Term
mkSumRightBuiltinTerm l = UPLC.Apply () (debruijnTermUnsafe $ UPLC.erase BuiltinList.sumr) (mkBuiltinList l)

mkScottList :: [Integer] -> Term
mkScottList l = compiledCodeToTerm (Tx.liftCode l)

mkSumLeftScottTerm :: [Integer] -> Term
mkSumLeftScottTerm l = UPLC.Apply () (debruijnTermUnsafe $ UPLC.erase ScottList.sum) (mkScottList l)

mkSumRightScottTerm :: [Integer] -> Term
mkSumRightScottTerm l = UPLC.Apply () (debruijnTermUnsafe $ UPLC.erase ScottList.sumr) (mkScottList l)


debruijnTermUnsafe :: UPLC.Term UPLC.Name uni fun ann
                    -> UPLC.Term UPLC.NamedDeBruijn uni fun ann
debruijnTermUnsafe = fromRight (error "debruijnTermUnsafe") . runExcept @UPLC.FreeVariableError . UPLC.deBruijnTerm
