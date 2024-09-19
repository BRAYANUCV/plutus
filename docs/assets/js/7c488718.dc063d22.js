"use strict";(self.webpackChunkdocusaurus=self.webpackChunkdocusaurus||[]).push([[9073],{6429:(e,t,n)=>{n.r(t),n.d(t,{assets:()=>d,contentTitle:()=>a,default:()=>u,frontMatter:()=>r,metadata:()=>o,toc:()=>l});var i=n(4848),s=n(8453);const r={sidebar_position:1},a="Plutus Ledger Language Version (Plutus V1/V2/V3)",o={id:"working-with-scripts/ledger-language-version",title:"Plutus Ledger Language Version (Plutus V1/V2/V3)",description:"As explained in Different Notions of Version, Plutus V1, V2 and V3 are not distinct programming languages; the primary difference lies in the arguments the script receives from the ledger, and the value it returns.",source:"@site/docs/working-with-scripts/ledger-language-version.md",sourceDirName:"working-with-scripts",slug:"/working-with-scripts/ledger-language-version",permalink:"/docs/working-with-scripts/ledger-language-version",draft:!1,unlisted:!1,editUrl:"https://github.com/IntersectMBO/plutus/edit/master/doc/docusaurus/docs/working-with-scripts/ledger-language-version.md",tags:[],version:"current",sidebarPosition:1,frontMatter:{sidebar_position:1},sidebar:"tutorialSidebar",previous:{title:"Working with scripts",permalink:"/docs/category/working-with-scripts"},next:{title:"Script Purposes",permalink:"/docs/working-with-scripts/script-purposes"}},d={},l=[{value:"ScriptContext",id:"scriptcontext",level:2},{value:"Plutus V1 and Plutus V2",id:"plutus-v1-and-plutus-v2",level:2},{value:"Spending Scripts",id:"spending-scripts",level:3},{value:"Minting, Certifying and Rewarding Scripts",id:"minting-certifying-and-rewarding-scripts",level:3},{value:"Script Evaluation and Unsaturated Scripts",id:"script-evaluation-and-unsaturated-scripts",level:3},{value:"Plutus V3",id:"plutus-v3",level:2}];function c(e){const t={a:"a",code:"code",h1:"h1",h2:"h2",h3:"h3",hr:"hr",li:"li",ol:"ol",p:"p",pre:"pre",section:"section",sup:"sup",...(0,s.R)(),...e.components};return(0,i.jsxs)(i.Fragment,{children:[(0,i.jsx)(t.h1,{id:"plutus-ledger-language-version-plutus-v1v2v3",children:"Plutus Ledger Language Version (Plutus V1/V2/V3)"}),"\n",(0,i.jsxs)(t.p,{children:["As explained in ",(0,i.jsx)(t.a,{href:"/docs/essential-concepts/versions",children:"Different Notions of Version"}),", Plutus V1, V2 and V3 are not distinct programming languages; the primary difference lies in the arguments the script receives from the ledger, and the value it returns.\nTherefore, Plutus V1, V2 and V3 can be understood as type signatures, in the sense that they each represent a subset of Untyped Plutus Core (UPLC) programs with specific types.\nAny UPLC program that matches the expected argument and return types can be considered and used as a Plutus V1, V2 or V3 script."]}),"\n",(0,i.jsx)(t.p,{children:"Next we'll start with a brief overview of the script context, followed by an in-depth explanation of these type signatures."}),"\n",(0,i.jsx)(t.h2,{id:"scriptcontext",children:"ScriptContext"}),"\n",(0,i.jsx)(t.p,{children:"Every Plutus script receives an argument called script context.\nIt contains information about the transaction the script is validating, such as inputs, outputs, transaction fee, signatures and so on.\nAdditionally, since a transaction may have multiple things to validate (e.g., it may be spending multiple script UTXOs, or performing both spending and minting), each of which is validated by a separate script, the script context also has a script purpose field, telling the script what exactly it is supposed to validate."}),"\n",(0,i.jsxs)(t.p,{children:["Plutus V1, V2 and V3 scripts receive different script contexts even when all else is equal.\nThis is because different ledger language versions are introduced in different ledger eras; transactions in different ledger eras have different fields - a new era usually adds new fields and may also change existing fields.\nAs a result, The script contexts for Plutus V1, V2 and V3 also have different fields, leading to different Haskell types (",(0,i.jsx)(t.a,{href:"https://plutus.cardano.intersectmbo.org/haddock/master/plutus-ledger-api/PlutusLedgerApi-V1-Contexts.html#t:ScriptContext",children:"V1"}),", ",(0,i.jsx)(t.a,{href:"https://plutus.cardano.intersectmbo.org/haddock/master/plutus-ledger-api/PlutusLedgerApi-V2-Contexts.html#t:ScriptContext",children:"V2"}),", ",(0,i.jsx)(t.a,{href:"https://plutus.cardano.intersectmbo.org/haddock/master/plutus-ledger-api/PlutusLedgerApi-V3-Contexts.html#t:ScriptContext",children:"V3"}),").\nWe cannot modify the script context fields of an existing ledger language version once it is published, since it would break existing scripts."]}),"\n",(0,i.jsxs)(t.p,{children:["In general, a ledger language version cannot be used in a transaction, if the ledger language version was introduced in ledger era A, the transaction uses features in ledger era B, and A is earlier than B.\nFor instance, Plutus V1 (introduced in the Alonzo era) scripts cannot be used in a transaction which utilizes inline datum (a Babbage era feature); Plutus V2 (introduced in the Babbage era) scripts cannot be used in a transaction that registers a DRep (introduced in the Conway era)",(0,i.jsx)(t.sup,{children:(0,i.jsx)(t.a,{href:"#user-content-fn-1",id:"user-content-fnref-1","data-footnote-ref":!0,"aria-describedby":"footnote-label",children:"1"})}),"."]}),"\n",(0,i.jsx)(t.h2,{id:"plutus-v1-and-plutus-v2",children:"Plutus V1 and Plutus V2"}),"\n",(0,i.jsxs)(t.p,{children:["Plutus V1 and Plutus V2 scripts have four ",(0,i.jsx)(t.a,{href:"https://plutus.cardano.intersectmbo.org/haddock/master/plutus-ledger-api/PlutusLedgerApi-V1-Contexts.html#t:ScriptPurpose",children:"script purposes"}),": spending, minting, certifying, and rewarding",(0,i.jsx)(t.sup,{children:(0,i.jsx)(t.a,{href:"#user-content-fn-2",id:"user-content-fnref-2","data-footnote-ref":!0,"aria-describedby":"footnote-label",children:"2"})}),".\nThe arguments a Plutus V1 or V2 script receives depend on the script purpose.\nThere is no requirement on the return value of a Plutus V1 and V2 script: script evaluation succeeds as long as the evaluation terminates without error, and the execution budget is not exceeded."]}),"\n",(0,i.jsx)(t.h3,{id:"spending-scripts",children:"Spending Scripts"}),"\n",(0,i.jsxs)(t.p,{children:["A Plutus V1/V2 spending script receives three arguments corresponding to datum, redeemer and script context.\nAll arguments are encoded as ",(0,i.jsx)(t.code,{children:"BuiltinData"}),".\nThus in Plutus Tx, a spending script has the following type:"]}),"\n",(0,i.jsx)(t.pre,{children:(0,i.jsx)(t.code,{className:"language-haskell",children:"BuiltinData -> BuiltinData -> BuiltinData -> any\n"})}),"\n",(0,i.jsxs)(t.p,{children:["To create a Plutus script using Plutus Tx, it is common to first write a function that takes the corresonding Haskell domain types and returns ",(0,i.jsx)(t.code,{children:"Bool"}),".\nFor example, the following function can be used to implement the main business logic of a Plutus V1 spending script:"]}),"\n",(0,i.jsx)(t.pre,{children:(0,i.jsx)(t.code,{className:"language-haskell",children:"myV1SpendingScriptTyped :: MyDatum -> MyRedeemer -> PlutusLedgerApi.V1.ScriptContext -> Bool\n"})}),"\n",(0,i.jsxs)(t.p,{children:["where ",(0,i.jsx)(t.code,{children:"MyDatum"})," and ",(0,i.jsx)(t.code,{children:"MyRedeemer"})," are your user-defined Haskell types specific to your contract.\nIf you are writing a Plutus V2 script, use ",(0,i.jsx)(t.code,{children:"PlutusLedgerApi.V2.ScriptContext"}),"."]}),"\n",(0,i.jsxs)(t.p,{children:["From ",(0,i.jsx)(t.code,{children:"myV1SpendingScriptTyped"}),", you can obtain ",(0,i.jsx)(t.code,{children:"BuiltinData -> BuiltinData -> BuiltinData -> any"}),", and subsequently compile it to UPLC, via"]}),"\n",(0,i.jsx)(t.pre,{children:(0,i.jsx)(t.code,{className:"language-haskell",children:"myV1SpendingScriptUntyped :: BuiltinData -> BuiltinData -> BuiltinData -> BuiltinUnit\nmyV1SpendingScriptUntyped myDatum myRedeemer scriptContext =\n  PlutusTx.Prelude.check\n    ( myV1SpendingScriptTyped\n        (PlutusTx.unsafeFromBuiltinData myDatum)\n        (PlutusTx.unsafeFromBuiltinData myRedeemer)\n        (PlutusTx.unsafeFromBuiltinData scriptContext)\n    )\n\nmyV1SpendingScriptCompiled :: CompiledCode (BuiltinData -> BuiltinData -> BuiltinData -> BuiltinUnit)\nmyV1SpendingScriptCompiled = $$(PlutusTx.compile [||myV1SpendingScriptUntyped||])\n"})}),"\n",(0,i.jsxs)(t.p,{children:[(0,i.jsx)(t.code,{children:"unsafeFromBuiltinData"})," is a method from the ",(0,i.jsx)(t.a,{href:"http://localhost:3000/docs/working-with-scripts/ledger-language-version",children:(0,i.jsx)(t.code,{children:"UnsafeFromData"})})," class.\nEach call to ",(0,i.jsx)(t.code,{children:"unsafeFromBuiltinData"})," decodes a ",(0,i.jsx)(t.code,{children:"BuiltinData"})," into a value of a Haskell domain type, failing if the conversion fails.\nThe ",(0,i.jsx)(t.code,{children:"check"})," function takes a ",(0,i.jsx)(t.code,{children:"Bool"})," and returns a ",(0,i.jsx)(t.code,{children:"BuiltinUnit"}),", throwing an error if the input is ",(0,i.jsx)(t.code,{children:"False"}),".\nIt is needed because returning ",(0,i.jsx)(t.code,{children:"False"})," does not cause the validation to fail; to fail the validation, an error needs to be thrown."]}),"\n",(0,i.jsxs)(t.p,{children:["In this example the script happens to return ",(0,i.jsx)(t.code,{children:"BuiltinUnit"}),", but this is not a requirement for Plutus V1 or V2."]}),"\n",(0,i.jsx)(t.h3,{id:"minting-certifying-and-rewarding-scripts",children:"Minting, Certifying and Rewarding Scripts"}),"\n",(0,i.jsx)(t.p,{children:"Unlike spending scripts, Plutus V1 and V2 scripts for minting, certifying and rewarding purposes take one fewer argument: there is no datum argument.\nThus in Plutus Tx, a minting, certifying or rewarding script should have the following type:"}),"\n",(0,i.jsx)(t.pre,{children:(0,i.jsx)(t.code,{className:"language-haskell",children:"BuiltinData -> BuiltinData -> any\n"})}),"\n",(0,i.jsx)(t.p,{children:"Since this type signature is shared by minting, certifying and rewarding scripts, the same script can be used for multiple of these three purposes, for example"}),"\n",(0,i.jsx)(t.pre,{children:(0,i.jsx)(t.code,{className:"language-haskell",children:"myV1MintingAndRewardingScriptTyped :: MyRedeemer -> PlutusLedgerApi.V1.ScriptContext -> Bool\nmyV1MintingAndRewardingScriptTyped myRedeemer scriptContext =\n  case scriptContextPurpose scriptContext of\n    Minting cs -> -- Perform minting validation\n    Rewarding cred -> -- Perform rewarding validation\n"})}),"\n",(0,i.jsx)(t.p,{children:"Because spending scripts take one more argument, the same script cannot be used both for spending validation and for a different purpose (minting, certifying or rewarding)."}),"\n",(0,i.jsx)(t.h3,{id:"script-evaluation-and-unsaturated-scripts",children:"Script Evaluation and Unsaturated Scripts"}),"\n",(0,i.jsx)(t.p,{children:"As said before, evaluating a Plutus V1 and V2 script succeeds as long as the evaluation terminates without error, and the budget is not exceeded."}),"\n",(0,i.jsx)(t.p,{children:"This means, crucially, that an unsaturated script (a script expecting more arguments than it receives) succeeds trivially, since the evaluation terminates almost immediately and returns a lambda.\nThus be careful: if, for example, you accidentally use a spending script (which expects three arguments) as a minting script (which will receive two arguments), it will always succeed, which is obviously not what you want."}),"\n",(0,i.jsx)(t.h2,{id:"plutus-v3",children:"Plutus V3"}),"\n",(0,i.jsxs)(t.p,{children:["Plutus V3 has two additional ",(0,i.jsx)(t.a,{href:"https://plutus.cardano.intersectmbo.org/haddock/master/plutus-ledger-api/PlutusLedgerApi-V3-Contexts.html#t:ScriptPurpose",children:"script purposes"})," for validating governance actions: voting and proposing."]}),"\n",(0,i.jsx)(t.p,{children:"Besides the usual differences between different Plutus ledger language versions, there are three additional key differences between Plutus V3 and V1/V2:"}),"\n",(0,i.jsxs)(t.ol,{children:["\n",(0,i.jsx)(t.li,{children:"All Plutus V3 scripts, regardless of script purpose, take a single argument: the script context.\nThe datum (for spending scripts) and the redeemer are part of the Plutus V3 script context.\nThis means the same script can be used for spending validation and for different purposes."}),"\n",(0,i.jsx)(t.li,{children:"The datum is now optional for spending scripts.\nThe script context may or may not contain a datum, depending on whether the UTXO being spent has a datum associated with it."}),"\n",(0,i.jsxs)(t.li,{children:["There is an additional condition for the evaluation of a Plutus V3 script to be considered successful: the return value must be a ",(0,i.jsx)(t.code,{children:"BuiltinUnit"}),"."]}),"\n"]}),"\n",(0,i.jsxs)(t.p,{children:["The first two points are attributed to ",(0,i.jsx)(t.a,{href:"https://developers.cardano.org/docs/governance/cardano-improvement-proposals/cip-0069/",children:"CIP-69"}),", whereas the third point is attributed to ",(0,i.jsx)(t.a,{href:"https://developers.cardano.org/docs/governance/cardano-improvement-proposals/cip-0117/",children:"CIP-117"}),"."]}),"\n",(0,i.jsx)(t.p,{children:"In other words, all Plutus V3 scripts should have the following type in Plutus Tx:"}),"\n",(0,i.jsx)(t.pre,{children:(0,i.jsx)(t.code,{className:"language-haskell",children:"BuiltinData -> BuiltinUnit\n"})}),"\n",(0,i.jsx)(t.p,{children:"Updating a Plutus V1/V2 script to turn it into a Plutus V3 script mostly involves straightforward refactoring, except that for a spending script, the case where the datum is absent will need to be handled."}),"\n",(0,i.jsx)(t.hr,{}),"\n","\n",(0,i.jsxs)(t.section,{"data-footnotes":!0,className:"footnotes",children:[(0,i.jsx)(t.h2,{className:"sr-only",id:"footnote-label",children:"Footnotes"}),"\n",(0,i.jsxs)(t.ol,{children:["\n",(0,i.jsxs)(t.li,{id:"user-content-fn-1",children:["\n",(0,i.jsxs)(t.p,{children:["There is one exception to this: Plutus V1 can be used in transactions with reference inputs, even though reference inputs were introduced in the Babbage era. ",(0,i.jsx)(t.a,{href:"#user-content-fnref-1","data-footnote-backref":"","aria-label":"Back to reference 1",className:"data-footnote-backref",children:"\u21a9"})]}),"\n"]}),"\n",(0,i.jsxs)(t.li,{id:"user-content-fn-2",children:["\n",(0,i.jsxs)(t.p,{children:["For more information on script purposes, refer to ",(0,i.jsx)(t.a,{href:"/docs/working-with-scripts/script-purposes",children:"Script Purposes"}),". ",(0,i.jsx)(t.a,{href:"#user-content-fnref-2","data-footnote-backref":"","aria-label":"Back to reference 2",className:"data-footnote-backref",children:"\u21a9"})]}),"\n"]}),"\n"]}),"\n"]})]})}function u(e={}){const{wrapper:t}={...(0,s.R)(),...e.components};return t?(0,i.jsx)(t,{...e,children:(0,i.jsx)(c,{...e})}):c(e)}},8453:(e,t,n)=>{n.d(t,{R:()=>a,x:()=>o});var i=n(6540);const s={},r=i.createContext(s);function a(e){const t=i.useContext(r);return i.useMemo((function(){return"function"==typeof e?e(t):{...t,...e}}),[t,e])}function o(e){let t;return t=e.disableParentContext?"function"==typeof e.components?e.components(s):e.components||s:a(e.components),i.createElement(r.Provider,{value:t},e.children)}}}]);