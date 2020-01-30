MACHINE Empty
// emtpy machine; use if you want to do pure CSP model checking with LTSmin
END

/*

To model check with LTSMin + ProB you need to do the following:

1. start ProB:
probcli /Users/leuschel/git_root/prob_examples/public_examples/CSPB/LTSMin/Empty.mch -csp_guide /Users/leuschel/git_root/prob_examples/public_examples/CSPB/LTSMin/Counters.csp -ltsmin2 ./ltsmin.probz

2. start LTSMin
prob2lts-sym ~/git_root/prob_prolog/ltsmin.probz --vset=lddmc --lace-workers=1


*/