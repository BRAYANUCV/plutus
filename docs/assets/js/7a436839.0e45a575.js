"use strict";(self.webpackChunkdocusaurus=self.webpackChunkdocusaurus||[]).push([[8350],{4798:(e,s,t)=>{t.r(s),t.d(s,{assets:()=>n,contentTitle:()=>o,default:()=>c,frontMatter:()=>r,metadata:()=>l,toc:()=>u});var a=t(4848),i=t(8453);const r={sidebar_position:30},o="Upgrading to Vasil and Plutus script addresses",l={id:"delve-deeper/upgrade-vasil-plutus-script-addresses",title:"Upgrading to Vasil and Plutus script addresses",description:"A Plutus V2 script will not have the same hash value as a Plutus V1 script",source:"@site/docs/delve-deeper/upgrade-vasil-plutus-script-addresses.md",sourceDirName:"delve-deeper",slug:"/delve-deeper/upgrade-vasil-plutus-script-addresses",permalink:"/docs/delve-deeper/upgrade-vasil-plutus-script-addresses",draft:!1,unlisted:!1,editUrl:"https://github.com/IntersectMBO/plutus/edit/master/doc/docusaurus/docs/delve-deeper/upgrade-vasil-plutus-script-addresses.md",tags:[],version:"current",sidebarPosition:30,frontMatter:{sidebar_position:30},sidebar:"tutorialSidebar",previous:{title:"Plutus language changes",permalink:"/docs/delve-deeper/plutus-language-changes"},next:{title:"Cost model parameters",permalink:"/docs/delve-deeper/cost-model-parameters"}},n={},u=[{value:"A Plutus V2 script will not have the same hash value as a Plutus V1 script",id:"a-plutus-v2-script-will-not-have-the-same-hash-value-as-a-plutus-v1-script",level:2},{value:"A Plutus V1 script will not necessarily have the same hash value when recompiled with a later version of the Plutus Compiler",id:"a-plutus-v1-script-will-not-necessarily-have-the-same-hash-value-when-recompiled-with-a-later-version-of-the-plutus-compiler",level:2},{value:"When to export and save the output of a compiled script",id:"when-to-export-and-save-the-output-of-a-compiled-script",level:2}];function d(e){const s={a:"a",code:"code",h1:"h1",h2:"h2",p:"p",...(0,i.R)(),...e.components};return(0,a.jsxs)(a.Fragment,{children:[(0,a.jsx)(s.h1,{id:"upgrading-to-vasil-and-plutus-script-addresses",children:"Upgrading to Vasil and Plutus script addresses"}),"\n",(0,a.jsx)(s.h2,{id:"a-plutus-v2-script-will-not-have-the-same-hash-value-as-a-plutus-v1-script",children:"A Plutus V2 script will not have the same hash value as a Plutus V1 script"}),"\n",(0,a.jsxs)(s.p,{children:["DApp developers might expect that when doing a migration from ",(0,a.jsx)(s.code,{children:"PlutusV1"})," scripts to ",(0,a.jsx)(s.code,{children:"PlutusV2"})," scripts, the same source code, when recompiled, will generate the same hash value of that script address.\nHowever, it is impossible for a compiled ",(0,a.jsx)(s.code,{children:"PlutusV2"})," script to have the same script hash and address as a compiled ",(0,a.jsx)(s.code,{children:"PlutusV1"})," script."]}),"\n",(0,a.jsxs)(s.p,{children:["Using the exact same script with different language versions will result in different hashes.\nThe exact same script (as in ",(0,a.jsx)(s.code,{children:"UPLC.Program"}),") can be used as a ",(0,a.jsx)(s.code,{children:"PlutusV1"})," script or a ",(0,a.jsx)(s.code,{children:"PlutusV2"})," script, and since the language version is part of the hash, the two hashes will be different."]}),"\n",(0,a.jsx)(s.h2,{id:"a-plutus-v1-script-will-not-necessarily-have-the-same-hash-value-when-recompiled-with-a-later-version-of-the-plutus-compiler",children:"A Plutus V1 script will not necessarily have the same hash value when recompiled with a later version of the Plutus Compiler"}),"\n",(0,a.jsxs)(s.p,{children:["Suppose you write your Haskell source code (Plutus Tx), compile it into Plutus Core code (PLC), generate its hash value, then use it in a transaction.\nIf you don't save your compiled code, and then decide to use the same script in the future, you would have to recompile it.\nThis could result in a different hash value of the script address even without upgrading from ",(0,a.jsx)(s.code,{children:"PlutusV1"})," to ",(0,a.jsx)(s.code,{children:"PlutusV2"})," scripts.\nThis is because the hash is computed based on the output of the compiled code."]}),"\n",(0,a.jsx)(s.p,{children:"Given Plutus compiler version changes, changes in the dependencies, and multiple other improvements, it is expected that the hash value of the script address will change after the source code is recompiled."}),"\n",(0,a.jsx)(s.h2,{id:"when-to-export-and-save-the-output-of-a-compiled-script",children:"When to export and save the output of a compiled script"}),"\n",(0,a.jsx)(s.p,{children:"Once you expect that you will not modify the on-chain part of your application and you don't want the hash value of your script address to change, the best way to keep it the same is to save the output of your final compiled Plutus Core code (PLC) to a blueprint file."}),"\n",(0,a.jsxs)(s.p,{children:["For details on how to export scripts as blueprints, please see ",(0,a.jsx)(s.a,{href:"/docs/working-with-scripts/producing-a-blueprint",children:"Producing a Plutus contract blueprint"}),"."]})]})}function c(e={}){const{wrapper:s}={...(0,i.R)(),...e.components};return s?(0,a.jsx)(s,{...e,children:(0,a.jsx)(d,{...e})}):d(e)}},8453:(e,s,t)=>{t.d(s,{R:()=>o,x:()=>l});var a=t(6540);const i={},r=a.createContext(i);function o(e){const s=a.useContext(r);return a.useMemo((function(){return"function"==typeof e?e(s):{...s,...e}}),[s,e])}function l(e){let s;return s=e.disableParentContext?"function"==typeof e.components?e.components(i):e.components||i:o(e.components),a.createElement(r.Provider,{value:s},e.children)}}}]);