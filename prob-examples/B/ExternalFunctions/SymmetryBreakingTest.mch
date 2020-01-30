MACHINE SymmetryBreakingTest
DEFINITIONS
 EXTERNAL_PREDICATE_LESS(T) == T*T;
 LESS(x,y) == (1=1);
 EXTERNAL_PREDICATE_LEQ_SYM_BREAK(T) == T*T;
 LEQ_SYM_BREAK(x,y) == (1=1);
 t== "aa";
 "LibraryIO.def"
SETS
 ID={aa,bb,cc}
CONSTANTS s
PROPERTIES
 !(x,y).(x /= y & LESS(x,y) => x=TRUE or y=TRUE) &
 !(x,y).(x /= y & x:s & y:s & LESS(x,y) => x=aa or y=aa)
ASSERTIONS
 !(x1,y).(x1 /= y => x1=TRUE or y=TRUE) ;
 !(x2,y).(x2 /= y & x2:s & y:s => x2=aa or y=aa)
END

