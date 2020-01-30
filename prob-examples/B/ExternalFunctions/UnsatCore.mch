MACHINE UnsatCore
SETS
 ID={aa,bb}
DEFINITIONS
  EXTERNAL_FUNCTION_UNSAT_CORE(T) == (POW(T)-->BOOL)*POW(T) --> POW(T);
  UNSAT_CORE(Fun,Set) == Set;
  EXTERNAL_FUNCTION_MAX_SAT(T) == (POW(T)-->BOOL)*POW(T) --> POW(T);
  MAX_SAT(Fun,Set) == Set;
  
  DUP(x) == (x \/ x)
CONSTANTS f, g
PROPERTIES
 f = %x.(x:POW(INTEGER)|bool(x /\ 1..2={})) &

 g = %x.(x:POW(ID)|bool(x /\ {aa}={}))
ASSERTIONS
  UNSAT_CORE(f,0..200) = {2};
  UNSAT_CORE(f,2..200) = {2};
  MAX_SAT(g,ID) = {bb};
  MAX_SAT(f,0..3) = {0,3}
VARIABLES xx
INVARIANT
 xx <: ID
INITIALISATION xx:=UNSAT_CORE(g,ID)
END

