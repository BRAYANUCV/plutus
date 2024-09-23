{-# LANGUAGE DataKinds           #-}
{-# LANGUAGE NoImplicitPrelude   #-}
{-# LANGUAGE TemplateHaskell     #-}
{-# LANGUAGE ScopedTypeVariables #-}
{-# LANGUAGE OverloadedStrings   #-}
{-# LANGUAGE TypeApplications    #-}
{-# LANGUAGE TypeFamilies        #-}
{-# LANGUAGE TypeOperators       #-}

module MiContrato where

import           Plutus.Contract
import           PlutusTx.Prelude
import           Ledger
import           Ledger.Constraints   as Constraints
import           Ledger.Ada           as Ada
import           Text.Printf          (printf)
import           Prelude              (IO, String, Show (..))

-- Contrato simple que registra un mensaje de log
{-# INLINABLE miContrato #-}
miContrato :: Contract () EmptySchema Text ()
miContrato = do
    logInfo @String "Este es un contrato inteligente en Haskell ejecutado en la blockchain de Cardano"

-- Compilación del contrato a Plutus Core
endpoints :: Contract () EmptySchema Text ()
endpoints = miContrato

-- Esta línea permite a Plutus crear el código para ejecutar el contrato
mkSchemaDefinitions ''EmptySchema
mkKnownCurrencies []

