MACHINE Counters
VARIABLES c1,c2,c3
INVARIANT
 c1:INTEGER & c2:INTEGER & c3:INTEGER // & c1+c2+c3 < 105
INITIALISATION c1,c2,c3 := 0,0,0
OPERATIONS
  Inc1 = IF c1 < 10 THEN c1 := c1+1 ELSE c1 := 0 END;
  Inc2 = IF c2 < 40 THEN c2 := c2+1 ELSE c2 := 0 END;
  Inc3 = IF c3 < 60 THEN c3 := c3+1 ELSE c3 := 0 END
END

/*

To model check with LTSMin + ProB you need to do the following:

1. start ProB:
probcli /Users/leuschel/git_root/prob_examples/public_examples/CSPB/LTSMin/Counters.mch -csp_guide /Users/leuschel/git_root/prob_examples/public_examples/CSPB/LTSMin/Counters.csp -ltsmin2 ./ltsmin.probz

2. start LTSMin
prob2lts-sym ~/git_root/prob_prolog/ltsmin.probz --vset=lddmc --lace-workers=1


*/