MACHINE WD_SetCompr_Error
SETS
 ID={aa,bb}
DEFINITIONS SET_PREF_TRY_FIND_ABORT == TRUE
ABSTRACT_CONSTANTS f
CONSTANTS set1, set2
PROPERTIES
 {x,y|x:POW1(1..2) & y=f(x)} = set1 &

 {x,y|x:POW1(1..3) & y=f(x)} = set2 &

 f= %xx.(xx:POW(INTEGER)|min(xx))
INVARIANT
  {x,y|x:POW(1..2) & y=f(x)} // this is not well-defined
   /= {x,y|x:POW1(1..2) & y=f(x)}
ASSERTIONS
  {x,y|x:POW(1..2) & y=f(x)} // this is not well-defined
   /= {x,y|x:POW1(1..2) & y=f(x)}
OPERATIONS
  res <-- Test1 = res := {x,y|x:POW(11..2) & y=f(x)}  ; // this is not well-defined
  res <-- Test2 = res :=  {x,y|x:POW1(1..2) & y=f(x)}
END

