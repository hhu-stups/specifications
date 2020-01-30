MACHINE Functions
SETS
 ID={aa,bb}
CONSTANTS fun, fun2
PROPERTIES fun:POW(ID*ID*ID) & 
  fun = {xx,yy,zz | xx: ID & yy: ID & zz : ID & zz =xx} & 
  fun2:POW(ID*ID*ID) & 
  fun2 = {xx,yy,zz | xx: ID & yy: ID & zz : ID & zz =xx & yy=xx}

VARIABLES xx,xx2
INVARIANT
xx: ID & xx2: ID
INITIALISATION xx  := fun(aa |-> bb)  /* ProB only gives first solution; but then fun is not a partial function */
            || xx2 := bb 
OPERATIONS
  Set(xx,yy,zz) = PRE xx: ID & yy: ID & zz:ID & zz = fun(xx |-> yy) THEN
     xx := zz
  END;
  Set2(val) = PRE val: ID & val = fun2(aa |-> aa) THEN
     xx2 := val
  END
END

