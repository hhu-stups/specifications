MACHINE GraphIso_Large_Random1000
/* A machine where we use ProB to check if two graphs are isomorphic */
/* Two graphs from the Random 3-regular graphs of different sizes series from
       http://www.tcs.hut.fi/Software/bliss/benchmarks/index.shtml */
/* (Benchmark graphs for evaluating graph automorphism and canonical labeling algorithms) */
/* see also the paper  http://doc.utwente.nl/72368/1/kant-research-topics-final.pdf */
/*
    Experiment on MacBookPro 3.06 GHz Core2Duo:
    
    time probcli GraphIso_Large_Random1000.mch -init -p CLPFD TRUE -expcterr setup_constants_fails
    ...
    unsatisfiable_component(1)
	Some solutions were found:
	n/int(1000)
	graph1/AVL.size=1500
	graph2/AVL.size=1500
	no_sol_for(p)
	All expected errors occured.
	! halt(0)

	real	0m41.270s
	user	0m36.403s
	sys	0m3.930s
*/
DEFINITIONS
 "rnd-3-reg-1000-1.def";
 "rnd-3-reg-1000-2.def";
 SET_PREF_TIME_OUT == 1000000
CONSTANTS n, graph1, graph2, p
PROPERTIES
 graph1 = RND_3_REG_1000_1 &
 graph2 = RND_3_REG_1000_2 &
 
 n= card( dom(graph1) \/ ran(graph1)) &

  p: 1..n >->> 1..n &
  !i.(i:1..n => p[graph1[{i}]] = graph2[{p(i)}])
OPERATIONS
  r <-- Perm(i) = PRE i:1..n THEN r:=p(i) END
END
