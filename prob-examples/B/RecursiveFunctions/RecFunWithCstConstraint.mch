MACHINE RecFunWithCstConstraint
/* this cannot be solved yet */
DEFINITIONS
 SET_PREF_TRACE_INFO == TRUE
ABSTRACT_CONSTANTS n,add_n
PROPERTIES
 n:1..10 & 
 add_n: INTEGER <-> INTEGER &
 add_n = %xb.(xb=0|n) \/ %xi.(xi>0|1+add_n(xi-1) )  &
 add_n(1) = 8 
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  Add = BEGIN xx:= add_n(xx) END
END

