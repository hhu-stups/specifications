MACHINE IDL_SimpleUnsat
/* Small test of an unsatisfiable property in Interval Difference Logic */
/*
 Here is how the example fares in Prolog's CLP(FD):
 :- use_module(library(clpfd)).
 
    X24 in -1..1000, X17 in -1..1000,
    DIFF #= X24-X17,
    DIFF #>= 1, -DIFF #>= 0
     --> INCONSISTENCY DETECTED BY CLP(FD)
     
    X24 in -200..200, X17 in -200..200,
    DIFF #= X24-X17, DIFFM #= X17-X24,
    DIFF #>= 1, DIFFM #>= 0
     --> INCONSISTENCY DETECTED BY CLP(FD)
     
    X24 in -200..200, X17 in -200..200,
    X24-X17 #>= 1, X17-X24 #>= 0
     --> INCONSISTENCY DETECTED BY CLP(FD)
    
    X24-X17 #>= 1, X17-X24 #>= 0
     --> INCONSISTENCY NOT DETECTED BY CLP(FD)


    X24-X17 #>= 1, X17-X24 #>= 0,
    X24 #>= -200
    --> TAKES VERY LONG TIME !

*/
DEFINITIONS SET_PREF_CLPFD == TRUE
CONSTANTS x24,x17
PROPERTIES
 x24:INT & x17:INT &
 (( 1  <= ( x24  - x17)) &  ( 0  <= ( x17  - x24)))
 /* Inconsistency now detected by ProB */
END