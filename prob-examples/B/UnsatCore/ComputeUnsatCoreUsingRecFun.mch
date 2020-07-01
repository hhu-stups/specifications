MACHINE ComputeUnsatCoreUsingRecFun
/* Computing the Unsat Core of a set predicate using a recursive function */
DEFINITIONS
 TS == POW(INTEGER); /* Type */
 mypred(Set) == ( 33 /: Set or 22/: Set);
 sel(S) == min(S)
ABSTRACT_CONSTANTS
  core
PROPERTIES
 /* assumption: we call core(x,c) with c = {} and x such that mypred(x) is false */
  core = %(x,c).(x={} & c:TS| c)
         \/
         %(x,c).(x /= {} & mypred((c \/ x) \ {sel(x)}) | core( x \ {sel(x)}, c \/ {sel(x)}) )
         \/
         %(x,c).(x /= {} & not(mypred((c \/ x) \ {sel(x)})) | core( x \ {sel(x)}, c) ) /* sel(x) not required for unsat */
ASSERTIONS
  core(1..44,{}) = {22,33}
END