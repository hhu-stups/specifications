MACHINE PartialSymmetryTest
/* A test to see whether by extracting parial symmetry between aa and bb one does
  not accidentally enable Movecc */
SETS
 ID ={aa,bb,cc}
CONSTANTS r PROPERTIES r=1
VARIABLES x,y
INVARIANT
 x<:ID & y<:ID
INITIALISATION x,y : (x<:ID & y<:ID & x /\ y = {} & x\/y = ID-{cc})
OPERATIONS
  MoveAB(yy) = PRE yy:ID & yy:x THEN x := x-{yy} || y:= y \/ {yy} END;
  MoveBA(yy) = PRE yy:ID & yy:y THEN y := y-{yy} || x:= x \/ {yy} END;
  Movecc = PRE cc:x THEN x := x - {cc} || y := y \/ {cc} END
END

