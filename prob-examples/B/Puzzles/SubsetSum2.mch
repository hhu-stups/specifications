MACHINE SubsetSum2
/* a slightly more elegant and compact version */
/*
$
$ From Katta G. Murty: "Optimization Models for Decision Making", page 340
$ http://ioe.engin.umich.edu/people/fac/books/murty/opti_model/junior-7.pdf
$ 
$ """
$ Example 7.8.1
$ 
$ A bank van had several bags of coins, each containing either
$ 16, 17, 23, 24, 39, or 40 coins. While the van was parked on the
$ street, thieves stole some bags. A total of 100 coins were lost.
$ It is required to find how many bags were stolen.
$ """
$
$ Compare with the following models:
$ * Comet: http://www.hakank.org/comet/subset_sum.co
$ * ECLiPSE: http://www.hakank.org/eclipse/subset_sum.ecl
$ * Gecode: http://www.hakank.org/gecode/subset_sum.cpp
$ * MiniZinc: http://www.hakank.org/minizinc/subset_sum.mzn
$
$ Model created by Hakan Kjellerstrand, hakank@bonetmail.com
$ See also my Tailor/Essence page: http://www.hakank.org/minion_tailor
*/
DEFINITIONS SET_PREF_CLPFD == TRUE
CONSTANTS coins, stolen
PROPERTIES
 coins = {16,17,23,24,39,40} &  /* number of coins in each bag */
 stolen : coins --> NATURAL & /* number of bags of each type stolen */
 SIGMA(x).(x:coins|stolen(x)*x)=100
OPERATIONS
 r <-- GetStolen(x) = PRE x:coins THEN r:=stolen(x) END
END

