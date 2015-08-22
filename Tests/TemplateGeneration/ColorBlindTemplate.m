(* ::Package:: *)

<< CATemplates`;
<< CATemplates`TemplateOperations`ExpandTemplate`;


TestTable[karyTable_, permutation_, k_] :=
  Module[
    {ruleTable},
    ruleTable = RuleTableFromKAry[karyTable, k];
    Reverse[Sort[(ruleTable /. permutation)]] == ruleTable
  ];



TestAllPermutations[ruleTable_, k_] :=
  And @@ (TestTable[ruleTable, #, k] & /@ PossibleStateReplacements[k]);



Print[
  ColorBlindTemplate[2] === SymmetricTemplate[BWTransform, 8][[1]][["rawList"]]
]


Print[
  And @@ (TestAllPermutations[#, 3] & /@ ExpandTemplateModK[ColorBlindTemplate[3], 3])
]
