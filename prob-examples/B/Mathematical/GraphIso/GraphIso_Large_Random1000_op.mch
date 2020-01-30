MACHINE GraphIso_Large_Random1000
/* A machine where we use ProB to check if two graphs are isomorphic */
/* Two graphs from the Random 3-regular graphs of different sizes series from
       http://www.tcs.hut.fi/Software/bliss/benchmarks/index.shtml */
/* (Benchmark graphs for evaluating graph automorphism and canonical labeling algorithms) */
/* see also the paper  http://doc.utwente.nl/72368/1/kant-research-topics-final.pdf */
DEFINITIONS
 "rnd-3-reg-1000-1.def";
 "rnd-3-reg-1000-2.def";
 SET_PREF_TIME_OUT == 40000;
 SET_PREF_CLPFD == TRUE;
 SET_PREF_MAXINT == 1024; SET_PREF_MININT == -1;
 SET_PREF_MAX_OPERATIONS == 1
CONSTANTS n, graph1, graph2
PROPERTIES
 graph1 = RND_3_REG_1000_1 &
 graph2 = RND_3_REG_1000_2 &
 
 n= card( dom(graph1) \/ ran(graph1))
ASSERTIONS
   dom(graph1) \/ ran(graph1) = 1..n;
   dom(graph2) \/ ran(graph2) = 1..n
VARIABLES pp
INVARIANT pp: 1..n >->> 1..n
INITIALISATION pp := %i.(i:1..n|i)
OPERATIONS
 /* ComputeIsoG1G2(p) = SELECT
      p: 1..n >->> 1..n &
      !i.(i:1..n => p[graph1[{i}]] = graph2[{p(i)}]) THEN
    pp := p
  END; */
  ComputeIsoG1G1(p) = SELECT
       p: 1..n --> 1..n & 
      !i.(i:1..n => p[graph1[{i}]] = graph1[{p(i)}])
      & !j.(j:1..n => p(j)=j)
   THEN
    pp := p
  END;
  r <-- IsoG1G1 = IF !i.(i:1..n => pp[graph1[{i}]] = graph1[{pp(i)}]) THEN r:= TRUE ELSE r:= FALSE END;
  r <-- IsoG1G2 = IF !i.(i:1..n => pp[graph1[{i}]] = graph2[{pp(i)}]) THEN r:= TRUE ELSE r:= FALSE END;
  r <-- Perm(i) = PRE i:1..n THEN r:=pp(i) END
END
