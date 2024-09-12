{-# LANGUAGE DerivingVia #-}
module PlutusLedgerApi.V3.ParamName
    ( ParamName (..)
    , tagWithParamNames
    ) where

import Data.Ix
import GHC.Generics
import PlutusLedgerApi.Common.ParamName

{-| The enumeration of all possible cost model parameter names for this language version.

IMPORTANT: The order of appearance of the data constructors here matters. DO NOT REORDER.
See Note [Quotation marks in cost model parameter constructors]
See Note [Cost model parameters from the ledger's point of view]
-}
data ParamName =
    AddInteger'cpu'arguments'intercept
  | AddInteger'cpu'arguments'slope
  | AddInteger'memory'arguments'intercept
  | AddInteger'memory'arguments'slope
  | AppendByteString'cpu'arguments'intercept
  | AppendByteString'cpu'arguments'slope
  | AppendByteString'memory'arguments'intercept
  | AppendByteString'memory'arguments'slope
  | AppendString'cpu'arguments'intercept
  | AppendString'cpu'arguments'slope
  | AppendString'memory'arguments'intercept
  | AppendString'memory'arguments'slope
  | BData'cpu'arguments
  | BData'memory'arguments
  | Blake2b_256'cpu'arguments'intercept
  | Blake2b_256'cpu'arguments'slope
  | Blake2b_256'memory'arguments
  | CekApplyCost'exBudgetCPU
  | CekApplyCost'exBudgetMemory
  | CekBuiltinCost'exBudgetCPU
  | CekBuiltinCost'exBudgetMemory
  | CekConstCost'exBudgetCPU
  | CekConstCost'exBudgetMemory
  | CekDelayCost'exBudgetCPU
  | CekDelayCost'exBudgetMemory
  | CekForceCost'exBudgetCPU
  | CekForceCost'exBudgetMemory
  | CekLamCost'exBudgetCPU
  | CekLamCost'exBudgetMemory
  | CekStartupCost'exBudgetCPU
  | CekStartupCost'exBudgetMemory
  | CekVarCost'exBudgetCPU
  | CekVarCost'exBudgetMemory
  | ChooseData'cpu'arguments
  | ChooseData'memory'arguments
  | ChooseList'cpu'arguments
  | ChooseList'memory'arguments
  | ChooseUnit'cpu'arguments
  | ChooseUnit'memory'arguments
  | ConsByteString'cpu'arguments'intercept
  | ConsByteString'cpu'arguments'slope
  | ConsByteString'memory'arguments'intercept
  | ConsByteString'memory'arguments'slope
  | ConstrData'cpu'arguments
  | ConstrData'memory'arguments
  | DecodeUtf8'cpu'arguments'intercept
  | DecodeUtf8'cpu'arguments'slope
  | DecodeUtf8'memory'arguments'intercept
  | DecodeUtf8'memory'arguments'slope
  | DivideInteger'cpu'arguments'constant
  | DivideInteger'cpu'arguments'model'arguments'c00
  | DivideInteger'cpu'arguments'model'arguments'c01
  | DivideInteger'cpu'arguments'model'arguments'c02
  | DivideInteger'cpu'arguments'model'arguments'c10
  | DivideInteger'cpu'arguments'model'arguments'c11
  | DivideInteger'cpu'arguments'model'arguments'c20
  | DivideInteger'cpu'arguments'model'arguments'minimum
  | DivideInteger'memory'arguments'intercept
  | DivideInteger'memory'arguments'minimum
  | DivideInteger'memory'arguments'slope
  | EncodeUtf8'cpu'arguments'intercept
  | EncodeUtf8'cpu'arguments'slope
  | EncodeUtf8'memory'arguments'intercept
  | EncodeUtf8'memory'arguments'slope
  | EqualsByteString'cpu'arguments'constant
  | EqualsByteString'cpu'arguments'intercept
  | EqualsByteString'cpu'arguments'slope
  | EqualsByteString'memory'arguments
  | EqualsData'cpu'arguments'intercept
  | EqualsData'cpu'arguments'slope
  | EqualsData'memory'arguments
  | EqualsInteger'cpu'arguments'intercept
  | EqualsInteger'cpu'arguments'slope
  | EqualsInteger'memory'arguments
  | EqualsString'cpu'arguments'constant
  | EqualsString'cpu'arguments'intercept
  | EqualsString'cpu'arguments'slope
  | EqualsString'memory'arguments
  | FstPair'cpu'arguments
  | FstPair'memory'arguments
  | HeadList'cpu'arguments
  | HeadList'memory'arguments
  | IData'cpu'arguments
  | IData'memory'arguments
  | IfThenElse'cpu'arguments
  | IfThenElse'memory'arguments
  | IndexByteString'cpu'arguments
  | IndexByteString'memory'arguments
  | LengthOfByteString'cpu'arguments
  | LengthOfByteString'memory'arguments
  | LessThanByteString'cpu'arguments'intercept
  | LessThanByteString'cpu'arguments'slope
  | LessThanByteString'memory'arguments
  | LessThanEqualsByteString'cpu'arguments'intercept
  | LessThanEqualsByteString'cpu'arguments'slope
  | LessThanEqualsByteString'memory'arguments
  | LessThanEqualsInteger'cpu'arguments'intercept
  | LessThanEqualsInteger'cpu'arguments'slope
  | LessThanEqualsInteger'memory'arguments
  | LessThanInteger'cpu'arguments'intercept
  | LessThanInteger'cpu'arguments'slope
  | LessThanInteger'memory'arguments
  | ListData'cpu'arguments
  | ListData'memory'arguments
  | MapData'cpu'arguments
  | MapData'memory'arguments
  | MkCons'cpu'arguments
  | MkCons'memory'arguments
  | MkNilData'cpu'arguments
  | MkNilData'memory'arguments
  | MkNilPairData'cpu'arguments
  | MkNilPairData'memory'arguments
  | MkPairData'cpu'arguments
  | MkPairData'memory'arguments
  | ModInteger'cpu'arguments'constant
  | ModInteger'cpu'arguments'model'arguments'c00
  | ModInteger'cpu'arguments'model'arguments'c01
  | ModInteger'cpu'arguments'model'arguments'c02
  | ModInteger'cpu'arguments'model'arguments'c10
  | ModInteger'cpu'arguments'model'arguments'c11
  | ModInteger'cpu'arguments'model'arguments'c20
  | ModInteger'cpu'arguments'model'arguments'minimum
  | ModInteger'memory'arguments'intercept
  | ModInteger'memory'arguments'slope
  | MultiplyInteger'cpu'arguments'intercept
  | MultiplyInteger'cpu'arguments'slope
  | MultiplyInteger'memory'arguments'intercept
  | MultiplyInteger'memory'arguments'slope
  | NullList'cpu'arguments
  | NullList'memory'arguments
  | QuotientInteger'cpu'arguments'constant
  | QuotientInteger'cpu'arguments'model'arguments'c00
  | QuotientInteger'cpu'arguments'model'arguments'c01
  | QuotientInteger'cpu'arguments'model'arguments'c02
  | QuotientInteger'cpu'arguments'model'arguments'c10
  | QuotientInteger'cpu'arguments'model'arguments'c11
  | QuotientInteger'cpu'arguments'model'arguments'c20
  | QuotientInteger'cpu'arguments'model'arguments'minimum
  | QuotientInteger'memory'arguments'intercept
  | QuotientInteger'memory'arguments'minimum
  | QuotientInteger'memory'arguments'slope
  | RemainderInteger'cpu'arguments'constant
  | RemainderInteger'cpu'arguments'model'arguments'c00
  | RemainderInteger'cpu'arguments'model'arguments'c01
  | RemainderInteger'cpu'arguments'model'arguments'c02
  | RemainderInteger'cpu'arguments'model'arguments'c10
  | RemainderInteger'cpu'arguments'model'arguments'c11
  | RemainderInteger'cpu'arguments'model'arguments'c20
  | RemainderInteger'cpu'arguments'model'arguments'minimum
  | RemainderInteger'memory'arguments'intercept
  | RemainderInteger'memory'arguments'slope
  | SerialiseData'cpu'arguments'intercept
  | SerialiseData'cpu'arguments'slope
  | SerialiseData'memory'arguments'intercept
  | SerialiseData'memory'arguments'slope
  | Sha2_256'cpu'arguments'intercept
  | Sha2_256'cpu'arguments'slope
  | Sha2_256'memory'arguments
  | Sha3_256'cpu'arguments'intercept
  | Sha3_256'cpu'arguments'slope
  | Sha3_256'memory'arguments
  | SliceByteString'cpu'arguments'intercept
  | SliceByteString'cpu'arguments'slope
  | SliceByteString'memory'arguments'intercept
  | SliceByteString'memory'arguments'slope
  | SndPair'cpu'arguments
  | SndPair'memory'arguments
  | SubtractInteger'cpu'arguments'intercept
  | SubtractInteger'cpu'arguments'slope
  | SubtractInteger'memory'arguments'intercept
  | SubtractInteger'memory'arguments'slope
  | TailList'cpu'arguments
  | TailList'memory'arguments
  | Trace'cpu'arguments
  | Trace'memory'arguments
  | UnBData'cpu'arguments
  | UnBData'memory'arguments
  | UnConstrData'cpu'arguments
  | UnConstrData'memory'arguments
  | UnIData'cpu'arguments
  | UnIData'memory'arguments
  | UnListData'cpu'arguments
  | UnListData'memory'arguments
  | UnMapData'cpu'arguments
  | UnMapData'memory'arguments
  | VerifyEcdsaSecp256k1Signature'cpu'arguments
  | VerifyEcdsaSecp256k1Signature'memory'arguments
  | VerifyEd25519Signature'cpu'arguments'intercept
  | VerifyEd25519Signature'cpu'arguments'slope
  | VerifyEd25519Signature'memory'arguments
  | VerifySchnorrSecp256k1Signature'cpu'arguments'intercept
  | VerifySchnorrSecp256k1Signature'cpu'arguments'slope
  | VerifySchnorrSecp256k1Signature'memory'arguments
  | CekConstrCost'exBudgetCPU
  | CekConstrCost'exBudgetMemory
  | CekCaseCost'exBudgetCPU
  | CekCaseCost'exBudgetMemory
  | Bls12_381_G1_add'cpu'arguments
  | Bls12_381_G1_add'memory'arguments
  | Bls12_381_G1_compress'cpu'arguments
  | Bls12_381_G1_compress'memory'arguments
  | Bls12_381_G1_equal'cpu'arguments
  | Bls12_381_G1_equal'memory'arguments
  | Bls12_381_G1_hashToGroup'cpu'arguments'intercept
  | Bls12_381_G1_hashToGroup'cpu'arguments'slope
  | Bls12_381_G1_hashToGroup'memory'arguments
  | Bls12_381_G1_neg'cpu'arguments
  | Bls12_381_G1_neg'memory'arguments
  | Bls12_381_G1_scalarMul'cpu'arguments'intercept
  | Bls12_381_G1_scalarMul'cpu'arguments'slope
  | Bls12_381_G1_scalarMul'memory'arguments
  | Bls12_381_G1_uncompress'cpu'arguments
  | Bls12_381_G1_uncompress'memory'arguments
  | Bls12_381_G2_add'cpu'arguments
  | Bls12_381_G2_add'memory'arguments
  | Bls12_381_G2_compress'cpu'arguments
  | Bls12_381_G2_compress'memory'arguments
  | Bls12_381_G2_equal'cpu'arguments
  | Bls12_381_G2_equal'memory'arguments
  | Bls12_381_G2_hashToGroup'cpu'arguments'intercept
  | Bls12_381_G2_hashToGroup'cpu'arguments'slope
  | Bls12_381_G2_hashToGroup'memory'arguments
  | Bls12_381_G2_neg'cpu'arguments
  | Bls12_381_G2_neg'memory'arguments
  | Bls12_381_G2_scalarMul'cpu'arguments'intercept
  | Bls12_381_G2_scalarMul'cpu'arguments'slope
  | Bls12_381_G2_scalarMul'memory'arguments
  | Bls12_381_G2_uncompress'cpu'arguments
  | Bls12_381_G2_uncompress'memory'arguments
  | Bls12_381_finalVerify'cpu'arguments
  | Bls12_381_finalVerify'memory'arguments
  | Bls12_381_millerLoop'cpu'arguments
  | Bls12_381_millerLoop'memory'arguments
  | Bls12_381_mulMlResult'cpu'arguments
  | Bls12_381_mulMlResult'memory'arguments
  | Keccak_256'cpu'arguments'intercept
  | Keccak_256'cpu'arguments'slope
  | Keccak_256'memory'arguments
  | Blake2b_224'cpu'arguments'intercept
  | Blake2b_224'cpu'arguments'slope
  | Blake2b_224'memory'arguments
  | IntegerToByteString'cpu'arguments'c0
  | IntegerToByteString'cpu'arguments'c1
  | IntegerToByteString'cpu'arguments'c2
  | IntegerToByteString'memory'arguments'intercept
  | IntegerToByteString'memory'arguments'slope
  | ByteStringToInteger'cpu'arguments'c0
  | ByteStringToInteger'cpu'arguments'c1
  | ByteStringToInteger'cpu'arguments'c2
  | ByteStringToInteger'memory'arguments'intercept
  | ByteStringToInteger'memory'arguments'slope
-- Chang+1
  | AndByteString'cpu'arguments'intercept
  | AndByteString'cpu'arguments'slope1
  | AndByteString'cpu'arguments'slope2
  | AndByteString'memory'arguments'intercept
  | AndByteString'memory'arguments'slope
  | OrByteString'cpu'arguments'intercept
  | OrByteString'cpu'arguments'slope1
  | OrByteString'cpu'arguments'slope2
  | OrByteString'memory'arguments'intercept
  | OrByteString'memory'arguments'slope
  | XorByteString'cpu'arguments'intercept
  | XorByteString'cpu'arguments'slope1
  | XorByteString'cpu'arguments'slope2
  | XorByteString'memory'arguments'intercept
  | XorByteString'memory'arguments'slope
  | ComplementByteString'cpu'arguments'intercept
  | ComplementByteString'cpu'arguments'slope
  | ComplementByteString'memory'arguments'intercept
  | ComplementByteString'memory'arguments'slope
  | ReadBit'cpu'arguments
  | ReadBit'memory'arguments
  | WriteBits'cpu'arguments'intercept
  | WriteBits'cpu'arguments'slope
  | WriteBits'memory'arguments'intercept
  | WriteBits'memory'arguments'slope
  | ReplicateByte'cpu'arguments'intercept
  | ReplicateByte'cpu'arguments'slope
  | ReplicateByte'memory'arguments'intercept
  | ReplicateByte'memory'arguments'slope
  | ShiftByteString'cpu'arguments'intercept
  | ShiftByteString'cpu'arguments'slope
  | ShiftByteString'memory'arguments'intercept
  | ShiftByteString'memory'arguments'slope
  | RotateByteString'cpu'arguments'intercept
  | RotateByteString'cpu'arguments'slope
  | RotateByteString'memory'arguments'intercept
  | RotateByteString'memory'arguments'slope
  | CountSetBits'cpu'arguments'intercept
  | CountSetBits'cpu'arguments'slope
  | CountSetBits'memory'arguments
  | FindFirstSetBit'cpu'arguments'intercept
  | FindFirstSetBit'cpu'arguments'slope
  | FindFirstSetBit'memory'arguments
  | Ripemd_160'cpu'arguments'intercept
  | Ripemd_160'cpu'arguments'slope
  | Ripemd_160'memory'arguments

--  not enabled yet:
--    ExpModInteger'cpu'arguments
--    ExpModInteger'memory'arguments
    deriving stock (Eq, Ord, Enum, Ix, Bounded, Generic)
    deriving IsParamName via (GenericParamName ParamName)
