MACHINE AB
SETS
 ID /* ={aa,bb} */
CONSTANTS r PROPERTIES r=1
VARIABLES x,y
INVARIANT
 x<:ID & y<:ID
INITIALISATION x,y : (x<:ID & y<:ID & x /\ y = {} & x\/y = ID)
OPERATIONS
  MoveAB(yy) = PRE yy:ID & yy:x THEN x := x-{yy} || y:= y \/ {yy} END;
  MoveBA(yy) = PRE yy:ID & yy:y THEN y := y-{yy} || x:= x \/ {yy} END
END

