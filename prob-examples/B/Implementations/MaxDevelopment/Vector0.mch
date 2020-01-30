MODEL
   Vector0
VARIABLES x,y
INVARIANT x:NAT & y:NAT
INITIALISATION x:=0||y:=0
OPERATIONS
  modify(v,w) = PRE v:NAT & w:NAT THEN x,y:=v,w END;
  v,w <-- value = v,w:=x,y
END