MACHINE Prj1NATURAL
DEFINITIONS
 SET_PREF_IGNORE_PRJ_TYPES == FALSE;
 SET_PREF_MAXINT == 2**31;
 SET_PREF_MININT == -(2**31+1)
SETS
 t_Operator={aa,bb}
CONSTANTS Op, Node
PROPERTIES
 Node = t_Operator*NATURAL1 &
 Op = %nd.(nd : Node|prj1(t_Operator,NATURAL)(nd))
VARIABLES xx
INVARIANT
 xx:t_Operator &
 xx = Op(xx,3)
INITIALISATION xx:= Op(aa,1)
OPERATIONS
  Set(yy) = PRE yy:t_Operator THEN xx:= Op(yy,2) END
END

