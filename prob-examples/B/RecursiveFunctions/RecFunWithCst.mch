MACHINE RecFunWithCst
SETS
 ID={aa,bb}
ABSTRACT_CONSTANTS n,add_n
PROPERTIES
 n:1..10 &
 add_n: INTEGER <-> INTEGER &
 add_n = %xb.(xb=0|n) \/ %x.(x>0|1+add_n(x-1) )
VARIABLES xx
INVARIANT
 xx:NATURAL
INITIALISATION xx:=0
OPERATIONS
  Add = BEGIN xx:= add_n(xx) END
END

