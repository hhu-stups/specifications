MACHINE ZeroMutRec
DEFINITIONS
  SET_PREF_SYMBOLIC == TRUE;
  SET_PREF_RECURSIVE == TRUE;
  SET_PREF_EXPAND_CLOSURES_FOR_STATE == FALSE
CONSTANTS f
PROPERTIES
 f:INTEGER <-> INTEGER &
 f = {x,res | x:INTEGER & res:INTEGER &
              (x<=0 => res = 0) &
              (x>0 => res = f(f(x-1))) }
OPERATIONS
  rr <-- ComputeF(y) = PRE y:INT THEN rr:= f(y) END
END

