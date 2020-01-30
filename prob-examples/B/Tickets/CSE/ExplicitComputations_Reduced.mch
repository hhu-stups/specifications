MACHINE ExplicitComputations_Reduced
/* A machine with some explicitly given results for certain computations */
SETS
  PROC = {p1,p2,p3}; SINGLE={one}
DEFINITIONS SET_PREF_MAXINT == 5; SET_PREF_MININT == -1;
 SET_PREF_CSE == TRUE
CONSTANTS
   d, s
PROPERTIES

  d = {p1,p2} & 
  d /= {p1} & 
  
  #rr.(rr:BOOL<->BOOL & card(rr)=2 & closure1(rr)/=rr) &
  
  /* interval sets */
  -1 .. 2 <: -2 .. 12 &

  /* Sequences */
  s = [p1,p2,p3] &
  s /: perm({p1}) & 
  
  /* image of infinite functions */
  %i.(i:NATURAL1|1000/i)[-1..2] = {500,1000}
  
END
