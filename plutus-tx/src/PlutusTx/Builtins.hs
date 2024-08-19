-- editorconfig-checker-disable-file

-- | Primitive names and functions for working with Plutus Core builtins.
module PlutusTx.Builtins (
                          -- * Bytestring builtins
                          BuiltinByteString
                         , appendByteString
                         , consByteString
                         , sliceByteString
                         , lengthOfByteString
                         , indexByteString
                         , emptyByteString
                         , equalsByteString
                         , lessThanByteString
                         , lessThanEqualsByteString
                         , greaterThanByteString
                         , greaterThanEqualsByteString
                         , sha2_256
                         , sha3_256
                         , blake2b_224
                         , blake2b_256
                         , keccak_256
                         , ripemd_160
                         , verifyEd25519Signature
                         , verifyEcdsaSecp256k1Signature
                         , verifySchnorrSecp256k1Signature
                         , decodeUtf8
                         -- * Integer builtins
                         , Integer
                         , addInteger
                         , subtractInteger
                         , multiplyInteger
                         , divideInteger
                         , modInteger
                         , quotientInteger
                         , remainderInteger
                         , greaterThanInteger
                         , greaterThanEqualsInteger
                         , lessThanInteger
                         , lessThanEqualsInteger
                         , equalsInteger
                         , expModInteger
                         -- * Error
                         , error
                         -- * Data
                         , BuiltinData
                         , chooseData
                         , matchData
                         , matchData'
                         , equalsData
                         , serialiseData
                         , mkConstr
                         , mkMap
                         , mkList
                         , mkI
                         , mkB
                         , unsafeDataAsConstr
                         , unsafeDataAsMap
                         , unsafeDataAsList
                         , unsafeDataAsI
                         , unsafeDataAsB
                         , BI.builtinDataToData
                         , BI.dataToBuiltinData
                         -- * Strings
                         , BuiltinString
                         , appendString
                         , emptyString
                         , equalsString
                         , encodeUtf8
                         -- * Pairs
                         , pairToPair
                         -- * Lists
                         , mkNil
                         , mkNilOpaque
                         , null
                         , matchList
                         , matchList'
                         , headMaybe
                         , BI.head
                         , BI.tail
                         , uncons
                         , unsafeUncons
                         -- * Tracing
                         , trace
                         -- * BLS12_381
                         , BuiltinBLS12_381_G1_Element
                         , bls12_381_G1_equals
                         , bls12_381_G1_add
                         , bls12_381_G1_scalarMul
                         , bls12_381_G1_neg
                         , bls12_381_G1_compress
                         , bls12_381_G1_uncompress
                         , bls12_381_G1_hashToGroup
                         , bls12_381_G1_compressed_zero
                         , bls12_381_G1_compressed_generator
                         , BuiltinBLS12_381_G2_Element
                         , bls12_381_G2_equals
                         , bls12_381_G2_add
                         , bls12_381_G2_scalarMul
                         , bls12_381_G2_neg
                         , bls12_381_G2_compress
                         , bls12_381_G2_uncompress
                         , bls12_381_G2_hashToGroup
                         , bls12_381_G2_compressed_zero
                         , bls12_381_G2_compressed_generator
                         , BuiltinBLS12_381_MlResult
                         , bls12_381_millerLoop
                         , bls12_381_mulMlResult
                         , bls12_381_finalVerify
                         -- * Conversions
                         , fromOpaque
                         , toOpaque
                         , useToOpaque
                         , useFromOpaque
                         , fromBuiltin
                         , toBuiltin
                         -- * Logical
                         , ByteOrder (..)
                         , integerToByteString
                         , byteStringToInteger
                         , andByteString
                         , orByteString
                         , xorByteString
                         , complementByteString
                         , readBit
                         , writeBits
                         , replicateByte
                         -- * Bitwise
                         , shiftByteString
                         , rotateByteString
                         , countSetBits
                         , findFirstSetBit
                         ) where

import Data.Maybe
import PlutusTx.Base (const, uncurry)
import PlutusTx.Bool (Bool (..))
import PlutusTx.Builtins.HasBuiltin
import PlutusTx.Builtins.HasOpaque
import PlutusTx.Builtins.Internal (BuiltinBLS12_381_G1_Element (..),
                                   BuiltinBLS12_381_G2_Element (..), BuiltinBLS12_381_MlResult (..),
                                   BuiltinByteString (..), BuiltinData, BuiltinString)
import PlutusTx.Builtins.Internal qualified as BI
import PlutusTx.Integer (Integer)

import GHC.ByteOrder (ByteOrder (BigEndian, LittleEndian))

{-# INLINABLE appendByteString #-}
-- | Concatenates two 'ByteString's.
appendByteString :: BuiltinByteString -> BuiltinByteString -> BuiltinByteString
appendByteString = BI.appendByteString

{-# INLINABLE consByteString #-}
-- | Adds a byte to the front of a 'ByteString'.
consByteString :: Integer -> BuiltinByteString -> BuiltinByteString
consByteString n bs = BI.consByteString (toOpaque n) bs

{-# INLINABLE sliceByteString #-}
-- | Returns the substring of a 'ByteString' from index 'start' of length 'n'.
sliceByteString :: Integer -> Integer -> BuiltinByteString -> BuiltinByteString
sliceByteString start n bs = BI.sliceByteString (toOpaque start) (toOpaque n) bs

{-# INLINABLE lengthOfByteString #-}
-- | Returns the length of a 'ByteString'.
lengthOfByteString :: BuiltinByteString -> Integer
lengthOfByteString = BI.lengthOfByteString

{-# INLINABLE indexByteString #-}
-- | Returns the byte of a 'ByteString' at index.
indexByteString :: BuiltinByteString -> Integer -> Integer
indexByteString b n = BI.indexByteString b (toOpaque n)

{-# INLINABLE emptyByteString #-}
-- | An empty 'ByteString'.
emptyByteString :: BuiltinByteString
emptyByteString = BI.emptyByteString

{-# INLINABLE sha2_256 #-}
-- | The SHA2-256 hash of a 'ByteString'
sha2_256 :: BuiltinByteString -> BuiltinByteString
sha2_256 = BI.sha2_256

{-# INLINABLE sha3_256 #-}
-- | The SHA3-256 hash of a 'ByteString'
sha3_256 :: BuiltinByteString -> BuiltinByteString
sha3_256 = BI.sha3_256

{-# INLINABLE blake2b_224 #-}
-- | The BLAKE2B-224 hash of a 'ByteString'
blake2b_224 :: BuiltinByteString -> BuiltinByteString
blake2b_224 = BI.blake2b_224

{-# INLINABLE blake2b_256 #-}
-- | The BLAKE2B-256 hash of a 'ByteString'
blake2b_256 :: BuiltinByteString -> BuiltinByteString
blake2b_256 = BI.blake2b_256

{-# INLINABLE keccak_256 #-}
-- | The KECCAK-256 hash of a 'ByteString'
keccak_256 :: BuiltinByteString -> BuiltinByteString
keccak_256 = BI.keccak_256

{-# INLINABLE ripemd_160 #-}
-- | The RIPEMD-160 hash of a 'ByteString'
ripemd_160 :: BuiltinByteString -> BuiltinByteString
ripemd_160 = BI.ripemd_160

{-# INLINABLE verifyEd25519Signature #-}
-- | Ed25519 signature verification. Verify that the signature is a signature of
-- the message by the public key. This will fail if key or the signature are not
-- of the expected length.
verifyEd25519Signature
    :: BuiltinByteString  -- ^ Public Key (32 bytes)
    -> BuiltinByteString  -- ^ Message    (arbirtary length)
    -> BuiltinByteString  -- ^ Signature  (64 bytes)
    -> Bool
verifyEd25519Signature pubKey message signature =
    fromOpaque (BI.verifyEd25519Signature pubKey message signature)

{-# INLINABLE equalsByteString #-}
-- | Check if two 'ByteString's are equal.
equalsByteString :: BuiltinByteString -> BuiltinByteString -> Bool
equalsByteString x y = fromOpaque (BI.equalsByteString x y)

{-# INLINABLE lessThanByteString #-}
-- | Check if one 'ByteString' is less than another.
lessThanByteString :: BuiltinByteString -> BuiltinByteString -> Bool
lessThanByteString x y = fromOpaque (BI.lessThanByteString x y)

{-# INLINABLE lessThanEqualsByteString #-}
-- | Check if one 'ByteString' is less than or equal to another.
lessThanEqualsByteString :: BuiltinByteString -> BuiltinByteString -> Bool
lessThanEqualsByteString x y = fromOpaque (BI.lessThanEqualsByteString x y)

{-# INLINABLE greaterThanByteString #-}
-- | Check if one 'ByteString' is greater than another.
greaterThanByteString :: BuiltinByteString -> BuiltinByteString -> Bool
greaterThanByteString x y = BI.ifThenElse (BI.lessThanEqualsByteString x y) False True

{-# INLINABLE greaterThanEqualsByteString #-}
-- | Check if one 'ByteString' is greater than another.
greaterThanEqualsByteString :: BuiltinByteString -> BuiltinByteString -> Bool
greaterThanEqualsByteString x y = BI.ifThenElse (BI.lessThanByteString x y) False True

{-# INLINABLE decodeUtf8 #-}
-- | Converts a ByteString to a String.
decodeUtf8 :: BuiltinByteString -> BuiltinString
decodeUtf8 = BI.decodeUtf8

{-# INLINEABLE verifyEcdsaSecp256k1Signature #-}
-- | Given an ECDSA SECP256k1 verification key, an ECDSA SECP256k1 signature,
-- and an ECDSA SECP256k1 message hash (all as 'BuiltinByteString's), verify the
-- hash with that key and signature.
--
-- = Note
--
-- There are additional well-formation requirements for the arguments beyond
-- their length:
--
-- * The first byte of the public key must correspond to the sign of the /y/
-- coordinate: this is @0x02@ if /y/ is even, and @0x03@ otherwise.
-- * The remaining bytes of the public key must correspond to the /x/
-- coordinate, as a big-endian integer.
-- * The first 32 bytes of the signature must correspond to the big-endian
-- integer representation of _r_.
-- * The last 32 bytes of the signature must correspond to the big-endian
-- integer representation of _s_.
--
-- While this primitive /accepts/ a hash, any caller should only pass it hashes
-- that they computed themselves: specifically, they should receive the
-- /message/ from a sender and hash it, rather than receiving the /hash/ from
-- said sender. Failure to do so can be
-- [dangerous](https://bitcoin.stackexchange.com/a/81116/35586). Other than
-- length, we make no requirements of what hash gets used.
--
-- = See also
--
-- *
-- [@secp256k1_ec_pubkey_serialize@](https://github.com/bitcoin-core/secp256k1/blob/master/include/secp256k1.h#L394);
-- this implements the format for the verification key that we accept, given a
-- length argument of 33 and the @SECP256K1_EC_COMPRESSED@ flag.
-- *
-- [@secp256k1_ecdsa_serialize_compact@](https://github.com/bitcoin-core/secp256k1/blob/master/include/secp256k1.h#L487);
-- this implements the format for the signature that we accept.
verifyEcdsaSecp256k1Signature
  :: BuiltinByteString -- ^ Verification key (33 bytes)
  -> BuiltinByteString -- ^ Message hash (32 bytes)
  -> BuiltinByteString -- ^ Signature (64 bytes)
  -> Bool
verifyEcdsaSecp256k1Signature vk msg sig =
  fromOpaque (BI.verifyEcdsaSecp256k1Signature vk msg sig)

{-# INLINEABLE verifySchnorrSecp256k1Signature #-}
-- | Given a Schnorr SECP256k1 verification key, a Schnorr SECP256k1 signature,
-- and a message (all as 'BuiltinByteString's), verify the message with that key
-- and signature.
--
-- = Note
--
-- There are additional well-formation requirements for the arguments beyond
-- their length. Throughout, we refer to co-ordinates of the point @R@.
--
-- * The bytes of the public key must correspond to the /x/ coordinate, as a
-- big-endian integer, as specified in BIP-340.
-- * The first 32 bytes of the signature must correspond to the /x/ coordinate,
-- as a big-endian integer, as specified in BIP-340.
-- * The last 32 bytes of the signature must correspond to the bytes of /s/, as
-- a big-endian integer, as specified in BIP-340.
--
-- = See also
--
-- * [BIP-340](https://github.com/bitcoin/bips/blob/master/bip-0340.mediawiki)
-- *
-- [@secp256k1_xonly_pubkey_serialize@](https://github.com/bitcoin-core/secp256k1/blob/master/include/secp256k1_extrakeys.h#L61);
-- this implements the format for the verification key that we accept.
-- *
-- [@secp256k1_schnorrsig_sign@](https://github.com/bitcoin-core/secp256k1/blob/master/include/secp256k1_schnorrsig.h#L129);
-- this implements the signing logic for signatures this builtin can verify.
verifySchnorrSecp256k1Signature
  :: BuiltinByteString -- ^ Verification key (32 bytes)
  -> BuiltinByteString -- ^ Message (arbitrary length)
  -> BuiltinByteString -- ^ Signature (64 bytes)
  -> Bool
verifySchnorrSecp256k1Signature vk msg sig =
  fromOpaque (BI.verifySchnorrSecp256k1Signature vk msg sig)

{-# INLINABLE addInteger #-}
-- | Add two 'Integer's.
addInteger :: Integer -> Integer -> Integer
addInteger x y = fromOpaque (BI.addInteger (toOpaque x) (toOpaque y))

{-# INLINABLE subtractInteger #-}
-- | Subtract two 'Integer's.
subtractInteger :: Integer -> Integer -> Integer
subtractInteger x y = fromOpaque (BI.subtractInteger (toOpaque x) (toOpaque y))

{-# INLINABLE multiplyInteger #-}
-- | Multiply two 'Integer's.
multiplyInteger :: Integer -> Integer -> Integer
multiplyInteger x y = fromOpaque (BI.multiplyInteger (toOpaque x) (toOpaque y))

{-# INLINABLE divideInteger #-}
-- | Divide two integers.
divideInteger :: Integer -> Integer -> Integer
divideInteger x y = fromOpaque (BI.divideInteger (toOpaque x) (toOpaque y))

{-# INLINABLE modInteger #-}
-- | Integer modulo operation.
modInteger :: Integer -> Integer -> Integer
modInteger x y = fromOpaque (BI.modInteger (toOpaque x) (toOpaque y))

{-# INLINABLE quotientInteger #-}
-- | Quotient of two integers.
quotientInteger :: Integer -> Integer -> Integer
quotientInteger x y = fromOpaque (BI.quotientInteger (toOpaque x) (toOpaque y))

{-# INLINABLE remainderInteger #-}
-- | Take the remainder of dividing two 'Integer's.
remainderInteger :: Integer -> Integer -> Integer
remainderInteger x y = fromOpaque (BI.remainderInteger (toOpaque x) (toOpaque y))

{-# INLINABLE greaterThanInteger #-}
-- | Check whether one 'Integer' is greater than another.
greaterThanInteger :: Integer -> Integer -> Bool
greaterThanInteger x y = BI.ifThenElse (BI.lessThanEqualsInteger x y) False True

{-# INLINABLE greaterThanEqualsInteger #-}
-- | Check whether one 'Integer' is greater than or equal to another.
greaterThanEqualsInteger :: Integer -> Integer -> Bool
greaterThanEqualsInteger x y = BI.ifThenElse (BI.lessThanInteger x y) False True

{-# INLINABLE lessThanInteger #-}
-- | Check whether one 'Integer' is less than another.
lessThanInteger :: Integer -> Integer -> Bool
lessThanInteger x y = fromOpaque (BI.lessThanInteger (toOpaque x) (toOpaque y))

{-# INLINABLE lessThanEqualsInteger #-}
-- | Check whether one 'Integer' is less than or equal to another.
lessThanEqualsInteger :: Integer -> Integer -> Bool
lessThanEqualsInteger x y = fromOpaque (BI.lessThanEqualsInteger (toOpaque x) (toOpaque y))

{-# INLINABLE equalsInteger #-}
-- | Check if two 'Integer's are equal.
equalsInteger :: Integer -> Integer -> Bool
equalsInteger x y = fromOpaque (BI.equalsInteger (toOpaque x) (toOpaque y))

{-# INLINABLE error #-}
-- | Aborts evaluation with an error.
error :: () -> a
error x = BI.error (toOpaque x)

{-# INLINABLE appendString #-}
-- | Append two 'String's.
appendString :: BuiltinString -> BuiltinString -> BuiltinString
appendString = BI.appendString

{-# INLINABLE emptyString #-}
-- | An empty 'String'.
emptyString :: BuiltinString
emptyString = BI.emptyString

{-# INLINABLE equalsString #-}
-- | Check if two strings are equal
equalsString :: BuiltinString -> BuiltinString -> Bool
equalsString x y = fromOpaque (BI.equalsString x y)

{-# INLINABLE trace #-}
-- | Emit the given string as a trace message before evaluating the argument.
trace :: BuiltinString -> a -> a
trace = BI.trace

{-# INLINABLE encodeUtf8 #-}
-- | Convert a String into a ByteString.
encodeUtf8 :: BuiltinString -> BuiltinByteString
encodeUtf8 = BI.encodeUtf8

{-# INLINABLE null #-}
null :: forall a. BI.BuiltinList a -> Bool
null l = fromOpaque (BI.null l)

{-# INLINABLE matchList #-}
matchList :: forall a r . BI.BuiltinList a -> (() -> r) -> (a -> BI.BuiltinList a -> r) -> r
matchList l nilCase consCase = BI.chooseList l nilCase (\_ -> consCase (BI.head l) (BI.tail l)) ()

{-# INLINABLE matchList' #-}
-- | Like `matchList` but evaluates @nilCase@ strictly.
matchList' :: forall a r . BI.BuiltinList a -> r -> (a -> BI.BuiltinList a -> r) -> r
matchList' l nilCase consCase = BI.chooseList l (const nilCase) (\_ -> consCase (BI.head l) (BI.tail l)) ()

{-# INLINE headMaybe #-}
headMaybe :: BI.BuiltinList a -> Maybe a
headMaybe l = matchList' l Nothing (\h _ -> Just h)

{-# INLINE uncons #-}
-- | Uncons a builtin list, failing if the list is empty, useful in patterns.
uncons :: BI.BuiltinList a -> Maybe (a, BI.BuiltinList a)
uncons l = matchList' l Nothing (\h t -> Just (h, t))

{-# INLINE unsafeUncons #-}
-- | Uncons a builtin list, failing if the list is empty, useful in patterns.
unsafeUncons :: BI.BuiltinList a -> (a, BI.BuiltinList a)
unsafeUncons l = (BI.head l, BI.tail l)

{-# INLINE pairToPair #-}
-- | Turn a builtin pair into a normal pair, useful in patterns.
pairToPair :: BI.BuiltinPair a b -> (a, b)
pairToPair tup = (BI.fst tup, BI.snd tup)

{-# INLINABLE chooseData #-}
-- | Given five values for the five different constructors of 'BuiltinData', selects
-- one depending on which corresponds to the actual constructor of the given value.
chooseData :: forall a . BuiltinData -> a -> a -> a -> a -> a -> a
chooseData = BI.chooseData

{-# INLINABLE serialiseData #-}
-- | Convert a String into a ByteString.
serialiseData :: BuiltinData -> BuiltinByteString
serialiseData = BI.serialiseData

{-# INLINABLE mkConstr #-}
-- | Constructs a 'BuiltinData' value with the @Constr@ constructor.
mkConstr :: Integer -> [BuiltinData] -> BuiltinData
mkConstr i args = BI.mkConstr (toOpaque i) (toOpaque args)

{-# INLINABLE mkMap #-}
-- | Constructs a 'BuiltinData' value with the @Map@ constructor.
mkMap :: [(BuiltinData, BuiltinData)] -> BuiltinData
mkMap es = BI.mkMap (toOpaque es)

{-# INLINABLE mkList #-}
-- | Constructs a 'BuiltinData' value with the @List@ constructor.
mkList :: [BuiltinData] -> BuiltinData
mkList l = BI.mkList (toOpaque l)

{-# INLINABLE mkI #-}
-- | Constructs a 'BuiltinData' value with the @I@ constructor.
mkI :: Integer -> BuiltinData
mkI = BI.mkI

{-# INLINABLE mkB #-}
-- | Constructs a 'BuiltinData' value with the @B@ constructor.
mkB :: BuiltinByteString -> BuiltinData
mkB = BI.mkB

{-# INLINABLE unsafeDataAsConstr #-}
-- | Deconstructs a 'BuiltinData' as a @Constr@, or fails if it is not one.
unsafeDataAsConstr :: BuiltinData -> (Integer, [BuiltinData])
unsafeDataAsConstr d = fromOpaque (BI.unsafeDataAsConstr d)

{-# INLINABLE unsafeDataAsMap #-}
-- | Deconstructs a 'BuiltinData' as a @Map@, or fails if it is not one.
unsafeDataAsMap :: BuiltinData -> [(BuiltinData, BuiltinData)]
unsafeDataAsMap d = fromOpaque (BI.unsafeDataAsMap d)

{-# INLINABLE unsafeDataAsList #-}
-- | Deconstructs a 'BuiltinData' as a @List@, or fails if it is not one.
unsafeDataAsList :: BuiltinData -> [BuiltinData]
unsafeDataAsList d = fromOpaque (BI.unsafeDataAsList d)

{-# INLINABLE unsafeDataAsI #-}
-- | Deconstructs a 'BuiltinData' as an @I@, or fails if it is not one.
unsafeDataAsI :: BuiltinData -> Integer
unsafeDataAsI d = fromOpaque (BI.unsafeDataAsI d)

{-# INLINABLE unsafeDataAsB #-}
-- | Deconstructs a 'BuiltinData' as a @B@, or fails if it is not one.
unsafeDataAsB :: BuiltinData -> BuiltinByteString
unsafeDataAsB = BI.unsafeDataAsB

{-# INLINABLE equalsData #-}
-- | Check if two 'BuiltinData's are equal.
equalsData :: BuiltinData -> BuiltinData -> Bool
equalsData d1 d2 = fromOpaque (BI.equalsData d1 d2)

{-# INLINABLE matchData #-}
-- | Given a 'BuiltinData' value and matching functions for the five constructors,
-- applies the appropriate matcher to the arguments of the constructor and returns the result.
matchData
    :: BuiltinData
    -> (Integer -> [BuiltinData] -> r)
    -> ([(BuiltinData, BuiltinData)] -> r)
    -> ([BuiltinData] -> r)
    -> (Integer -> r)
    -> (BuiltinByteString -> r)
    -> r
matchData d constrCase mapCase listCase iCase bCase =
   chooseData
   d
   (\_ -> uncurry constrCase (unsafeDataAsConstr d))
   (\_ -> mapCase (unsafeDataAsMap d))
   (\_ -> listCase (unsafeDataAsList d))
   (\_ -> iCase (unsafeDataAsI d))
   (\_ -> bCase (unsafeDataAsB d))
   ()

{-# INLINABLE matchData' #-}
-- | Given a 'BuiltinData' value and matching functions for the five constructors,
-- applies the appropriate matcher to the arguments of the constructor and returns the result.
matchData'
    :: BuiltinData
    -> (Integer -> BI.BuiltinList BuiltinData -> r)
    -> (BI.BuiltinList (BI.BuiltinPair BuiltinData BuiltinData) -> r)
    -> (BI.BuiltinList BuiltinData -> r)
    -> (Integer -> r)
    -> (BuiltinByteString -> r)
    -> r
matchData' d constrCase mapCase listCase iCase bCase =
   chooseData
   d
   (\_ -> let tup = BI.unsafeDataAsConstr d in constrCase (BI.fst tup) (BI.snd tup))
   (\_ -> mapCase (BI.unsafeDataAsMap d))
   (\_ -> listCase (BI.unsafeDataAsList d))
   (\_ -> iCase (unsafeDataAsI d))
   (\_ -> bCase (unsafeDataAsB d))
   ()

-- G1 --
{-# INLINABLE bls12_381_G1_equals #-}
bls12_381_G1_equals :: BuiltinBLS12_381_G1_Element -> BuiltinBLS12_381_G1_Element -> Bool
bls12_381_G1_equals a b = fromOpaque (BI.bls12_381_G1_equals a b)

{-# INLINABLE bls12_381_G1_add #-}
bls12_381_G1_add :: BuiltinBLS12_381_G1_Element -> BuiltinBLS12_381_G1_Element -> BuiltinBLS12_381_G1_Element
bls12_381_G1_add = BI.bls12_381_G1_add

{-# INLINABLE bls12_381_G1_scalarMul #-}
bls12_381_G1_scalarMul :: Integer -> BuiltinBLS12_381_G1_Element -> BuiltinBLS12_381_G1_Element
bls12_381_G1_scalarMul = BI.bls12_381_G1_scalarMul

{-# INLINABLE bls12_381_G1_neg #-}
bls12_381_G1_neg :: BuiltinBLS12_381_G1_Element -> BuiltinBLS12_381_G1_Element
bls12_381_G1_neg = BI.bls12_381_G1_neg

{-# INLINABLE bls12_381_G1_compress #-}
bls12_381_G1_compress :: BuiltinBLS12_381_G1_Element -> BuiltinByteString
bls12_381_G1_compress = BI.bls12_381_G1_compress

{-# INLINABLE bls12_381_G1_uncompress #-}
bls12_381_G1_uncompress :: BuiltinByteString -> BuiltinBLS12_381_G1_Element
bls12_381_G1_uncompress = BI.bls12_381_G1_uncompress

{-# INLINABLE bls12_381_G1_hashToGroup #-}
bls12_381_G1_hashToGroup :: BuiltinByteString -> BuiltinByteString -> BuiltinBLS12_381_G1_Element
bls12_381_G1_hashToGroup = BI.bls12_381_G1_hashToGroup

{-# INLINABLE bls12_381_G1_compressed_zero #-}
bls12_381_G1_compressed_zero :: BuiltinByteString
bls12_381_G1_compressed_zero = BI.bls12_381_G1_compressed_zero

{-# INLINABLE bls12_381_G1_compressed_generator #-}
bls12_381_G1_compressed_generator :: BuiltinByteString
bls12_381_G1_compressed_generator = BI.bls12_381_G1_compressed_generator

-- G2 --
{-# INLINABLE bls12_381_G2_equals #-}
bls12_381_G2_equals :: BuiltinBLS12_381_G2_Element -> BuiltinBLS12_381_G2_Element -> Bool
bls12_381_G2_equals a b = fromOpaque (BI.bls12_381_G2_equals a b)

{-# INLINABLE bls12_381_G2_add #-}
bls12_381_G2_add :: BuiltinBLS12_381_G2_Element -> BuiltinBLS12_381_G2_Element -> BuiltinBLS12_381_G2_Element
bls12_381_G2_add = BI.bls12_381_G2_add

{-# INLINABLE bls12_381_G2_scalarMul #-}
bls12_381_G2_scalarMul :: Integer -> BuiltinBLS12_381_G2_Element -> BuiltinBLS12_381_G2_Element
bls12_381_G2_scalarMul = BI.bls12_381_G2_scalarMul

{-# INLINABLE bls12_381_G2_neg #-}
bls12_381_G2_neg :: BuiltinBLS12_381_G2_Element -> BuiltinBLS12_381_G2_Element
bls12_381_G2_neg = BI.bls12_381_G2_neg

{-# INLINABLE bls12_381_G2_compress #-}
bls12_381_G2_compress :: BuiltinBLS12_381_G2_Element -> BuiltinByteString
bls12_381_G2_compress = BI.bls12_381_G2_compress

{-# INLINABLE bls12_381_G2_uncompress #-}
bls12_381_G2_uncompress :: BuiltinByteString -> BuiltinBLS12_381_G2_Element
bls12_381_G2_uncompress = BI.bls12_381_G2_uncompress

{-# INLINABLE bls12_381_G2_hashToGroup #-}
bls12_381_G2_hashToGroup :: BuiltinByteString -> BuiltinByteString -> BuiltinBLS12_381_G2_Element
bls12_381_G2_hashToGroup = BI.bls12_381_G2_hashToGroup

{-# INLINABLE bls12_381_G2_compressed_zero #-}
bls12_381_G2_compressed_zero :: BuiltinByteString
bls12_381_G2_compressed_zero = BI.bls12_381_G2_compressed_zero

{-# INLINABLE bls12_381_G2_compressed_generator #-}
bls12_381_G2_compressed_generator :: BuiltinByteString
bls12_381_G2_compressed_generator = BI.bls12_381_G2_compressed_generator

-- Pairing --
{-# INLINABLE bls12_381_millerLoop #-}
bls12_381_millerLoop :: BuiltinBLS12_381_G1_Element -> BuiltinBLS12_381_G2_Element -> BuiltinBLS12_381_MlResult
bls12_381_millerLoop = BI.bls12_381_millerLoop

{-# INLINABLE bls12_381_mulMlResult #-}
bls12_381_mulMlResult ::  BuiltinBLS12_381_MlResult -> BuiltinBLS12_381_MlResult -> BuiltinBLS12_381_MlResult
bls12_381_mulMlResult = BI.bls12_381_mulMlResult

{-# INLINABLE bls12_381_finalVerify #-}
bls12_381_finalVerify :: BuiltinBLS12_381_MlResult -> BuiltinBLS12_381_MlResult -> Bool
bls12_381_finalVerify a b = fromOpaque (BI.bls12_381_finalVerify a b)

-- Bitwise conversions

-- The PLC builtins take a boolean argument to indicate the endianness of the
-- conversion, but here we use GHC.ByteOrder.ByteOrder for clarity.
byteOrderToBool :: ByteOrder -> Bool
byteOrderToBool BigEndian    = True
byteOrderToBool LittleEndian = False
{-# INLINABLE byteOrderToBool #-}

-- | Convert a 'BuiltinInteger' into a 'BuiltinByteString', as described in
-- [CIP-121](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0121).
-- The first argument indicates the endianness of the conversion and the third
-- argument is the integer to be converted, which must be non-negative.  The
-- second argument must also be non-negative and it indicates the required width
-- of the output.  If the width is zero then the output is the smallest
-- bytestring which can contain the converted input (and in this case, the
-- integer 0 encodes to the empty bytestring).  If the width is nonzero then the
-- output bytestring will be padded to the required width with 0x00 bytes (on
-- the left for big-endian conversions and on the right for little-endian
-- conversions); if the input integer is too big to fit into a bytestring of the
-- specified width then the conversion will fail.  Conversion will also fail if
-- the specified width is greater than 8192 or the input integer is too big to
-- fit into a bytestring of length 8192.
{-# INLINABLE integerToByteString #-}
integerToByteString :: ByteOrder -> Integer -> Integer -> BuiltinByteString
integerToByteString endianness = BI.integerToByteString (toOpaque (byteOrderToBool endianness))

-- | Convert a 'BuiltinByteString' to a 'BuiltinInteger', as described in
-- [CIP-121](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0121).
-- The first argument indicates the endianness of the conversion and the second
-- is the bytestring to be converted.  There is no limitation on the size of
-- the bytestring.  The empty bytestring is converted to the integer 0.
{-# INLINABLE byteStringToInteger #-}
byteStringToInteger :: ByteOrder -> BuiltinByteString -> Integer
byteStringToInteger endianness =
  BI.byteStringToInteger (toOpaque (byteOrderToBool endianness))

-- Bitwise operations

-- | Shift a 'BuiltinByteString', as per
-- [CIP-123](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0123).
{-# INLINEABLE shiftByteString #-}
shiftByteString :: BuiltinByteString -> Integer -> BuiltinByteString
shiftByteString = BI.shiftByteString

-- | Rotate a 'BuiltinByteString', as per
-- [CIP-123](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0123).
{-# INLINEABLE rotateByteString #-}
rotateByteString :: BuiltinByteString -> Integer -> BuiltinByteString
rotateByteString = BI.rotateByteString

-- | Count the set bits in a 'BuiltinByteString', as per
-- [CIP-123](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0123).
{-# INLINEABLE countSetBits #-}
countSetBits :: BuiltinByteString -> Integer
countSetBits = BI.countSetBits

-- | Find the lowest index of a set bit in a 'BuiltinByteString', as per
-- [CIP-123](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0123).
--
-- If given a 'BuiltinByteString' which consists only of zero bytes (including the empty
-- 'BuiltinByteString', this returns @-1@.
{-# INLINEABLE findFirstSetBit #-}
findFirstSetBit :: BuiltinByteString -> Integer
findFirstSetBit = BI.findFirstSetBit

-- Logical operations

-- | Perform logical AND on two 'BuiltinByteString' arguments, as described in
-- [CIP-122](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#bitwiselogicaland).
--
-- The first argument indicates whether padding semantics should be used or not;
-- if 'False', truncation semantics will be used instead.
--
-- = See also
--
-- * [Padding and truncation
-- semantics](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#padding-versus-truncation-semantics)
-- * [Bit indexing
-- scheme](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#bit-indexing-scheme)
{-# INLINEABLE andByteString #-}
andByteString ::
  Bool ->
  BuiltinByteString ->
  BuiltinByteString ->
  BuiltinByteString
andByteString b = BI.andByteString (toOpaque b)

-- | Perform logical OR on two 'BuiltinByteString' arguments, as described
-- [here](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#bitwiselogicalor).
--
-- The first argument indicates whether padding semantics should be used or not;
-- if 'False', truncation semantics will be used instead.
--
-- = See also
--
-- * [Padding and truncation
-- semantics](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#padding-versus-truncation-semantics)
-- * [Bit indexing
-- scheme](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#bit-indexing-scheme)
{-# INLINEABLE orByteString #-}
orByteString ::
  Bool ->
  BuiltinByteString ->
  BuiltinByteString ->
  BuiltinByteString
orByteString b = BI.orByteString (toOpaque b)

-- | Perform logical XOR on two 'BuiltinByteString' arguments, as described
-- [here](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#bitwiselogicalxor).
--
-- The first argument indicates whether padding semantics should be used or not;
-- if 'False', truncation semantics will be used instead.
--
-- = See also
--
-- * [Padding and truncation
-- semantics](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#padding-versus-truncation-semantics)
-- * [Bit indexing
-- scheme](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#bit-indexing-scheme)
{-# INLINEABLE xorByteString #-}
xorByteString ::
  Bool ->
  BuiltinByteString ->
  BuiltinByteString ->
  BuiltinByteString
xorByteString b = BI.xorByteString (toOpaque b)

-- | Perform logical complement on a 'BuiltinByteString', as described
-- [here](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#bitwiselogicalcomplement).
--
-- = See also
--
-- * [Bit indexing
-- scheme](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#bit-indexing-scheme)
{-# INLINEABLE complementByteString #-}
complementByteString ::
  BuiltinByteString ->
  BuiltinByteString
complementByteString = BI.complementByteString

-- | Read a bit at the _bit_ index given by the 'Integer' argument in the
-- 'BuiltinByteString' argument. The result will be 'True' if the corresponding bit is set, and
-- 'False' if it is clear. Will error if given an out-of-bounds index argument; that is, if the
-- index is either negative, or equal to or greater than the total number of bits in the
-- 'BuiltinByteString' argument.
--
-- = See also
--
-- * [Bit indexing
-- scheme](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#bit-indexing-scheme)
-- * [Operation
-- description](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#readbit)
{-# INLINEABLE readBit #-}
readBit ::
  BuiltinByteString ->
  Integer ->
  Bool
readBit bs i = fromOpaque (BI.readBit bs i)

-- | Given a 'BuiltinByteString', a list of indexes to change, and a list of values to change those
-- indexes to, set the /bit/ at each of the specified index as follows:
--
-- * If the corresponding entry in the list of values is 'True', set that bit;
-- * Otherwise, clear that bit.
--
-- Will error if any of the indexes are out-of-bounds: that is, if the index is either negative, or
-- equal to or greater than the total number of bits in the 'BuiltinByteString' argument.
--
-- If the two list arguments have mismatched lengths, the longer argument will be truncated to match
-- the length of the shorter one:
--
-- * @writeBits bs [0, 1, 4] [True]@ is the same as @writeBits bs [0] [True]@
-- * @writeBits bs [0] [True, False, True]@ is the same as @writeBits bs [0] [True]@
--
-- = Note
--
-- This differs slightly from the description of the [corresponding operation in
-- CIP-122](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#writebits); instead of a
-- single changelist argument comprised of pairs, we instead pass two lists, one for indexes to
-- change, and one for the values to change those indexes to. Effectively, we are passing the
-- changelist argument \'unzipped\'.
--
-- = See also
--
-- * [Bit indexing
-- scheme](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#bit-indexing-scheme)
-- * [Operation
-- description](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#writebits)
{-# INLINEABLE writeBits #-}
writeBits ::
  BuiltinByteString ->
  [Integer] ->
  [Bool] ->
  BuiltinByteString
writeBits bs ixes bits = BI.writeBits bs (toOpaque ixes) (toOpaque bits)

-- | Given a length (first argument) and a byte (second argument), produce a 'BuiltinByteString' of
-- that length, with that byte in every position. Will error if given a negative length, or a second
-- argument that isn't a byte (less than 0, greater than 255).
--
-- = See also
--
-- * [Operation
-- description](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0122#replicateByteString)
{-# INLINEABLE replicateByte #-}
replicateByte ::
  Integer ->
  Integer ->
  BuiltinByteString
replicateByte = BI.replicateByte


-- | FIXME
--
-- = See also
--
-- * [Operation
-- description](https://github.com/cardano-foundation/CIPs/tree/master/CIP-0109)
{-# INLINEABLE expModInteger #-}
expModInteger ::
  Integer ->
  Integer ->
  Integer ->
  Integer
expModInteger = BI.expModInteger
