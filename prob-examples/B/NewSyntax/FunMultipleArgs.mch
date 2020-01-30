MACHINE FunMultipleArgs
SETS
  AA = {aa,bb}
VARIABLES f
INVARIANT
  f : AA * NAT +-> NAT
INITIALISATION
  f:= { (aa|->1)|->2 }
OPERATIONS
  setf(v) = PRE v: NAT & v<2 THEN f:= %(x,y).(x:AA & y:NAT| v) END;
  cc <-- apply(xx,yy) = PRE xx:AA & yy:NAT & (xx|->yy):dom(f) THEN
    cc := f(xx,yy)
  END
END