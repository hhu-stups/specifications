MACHINE Factorial_Closure1
/* An encoding of recursion using closure1 */
ABSTRACT_CONSTANTS fac_expand, fac
PROPERTIES
 fac_expand = %(x,acc).(x>=1|(x-1,x*acc)) &
 fac = %x.(x:NATURAL1|closure1(fac_expand)[{(x,1)}](0))
VARIABLES xx
INVARIANT
 xx:NATURAL1
INITIALISATION xx:=1
OPERATIONS
  r <-- ComputeFac(x) = PRE xx=x THEN r:= fac(x) || xx:=xx+1 END
END

