MACHINE Test_Inv_Reduction2
SETS
 ID={aa,bb,cc}
VARIABLES xx, yy, zz, uu
INVARIANT
 xx:ID & yy:ID
       & zz:{aa,bb} & uu:0..2000
ASSERTIONS
  zz:{aa,bb}
INITIALISATION xx::{aa,bb} || yy := aa || zz := aa || uu := 0
OPERATIONS
//  Sety = BEGIN yy := 1 END;
  Setxaa = BEGIN xx := aa END;
  Setxbb = BEGIN xx := bb END;
  Setxaabbcc = BEGIN xx :: {aa,bb,cc} END;

  Setyy = BEGIN yy :: {aa,bb,cc} END;

  Setzz =  BEGIN zz := bb END;
  Setzz2 = SELECT zz=bb
                   & zz=aa  // comment out to find error
           THEN zz:= cc END;

  IncUU = SELECT uu<2000 THEN uu:=uu+1 END
END

/*
probcli /Users/leuschel/git_root/prob_examples/public_examples/B/SymmetryReduction/PartialOrderTests/Test_Inv_Reduction2.mch -model-check -nodead
19 seconds

probcli /Users/leuschel/git_root/prob_examples/public_examples/B/SymmetryReduction/PartialOrderTests/Test_Inv_Reduction2.mch -model-check -nodead -p por ample_sets
23.6 seconds

probcli /Users/leuschel/git_root/prob_examples/public_examples/B/SymmetryReduction/PartialOrderTests/Test_Inv_Reduction2.mch -model-check -nodead -p OPERATION_REUSE full
12.2 seconds

time probcli /Users/leuschel/git_root/prob_examples/public_examples/B/SymmetryReduction/PartialOrderTests/Test_Inv_Reduction2.mch -mc_with_lts_seq  -ltsmin-option por -nodead
3 seconds

 time probcli /Users/leuschel/git_root/prob_examples/public_examples/B/SymmetryReduction/PartialOrderTests/Test_Inv_Reduction2.mch -mc_with_lts_seq   -nodead
 2.7 seconds
*/
