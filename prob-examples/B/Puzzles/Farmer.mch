MACHINE Farmer
SETS
 Obj={farmer,fox, chicken, grain}
DEFINITIONS
  safe(s) == (!(x,y).(x:s & y:s => x|->y /: eats));
  GOAL == (far=Obj);
  DIFF(A,TARGET) == (card(A-TARGET) - card(TARGET /\ A));
  HEURISTIC_FUNCTION == DIFF(far,Obj)
CONSTANTS eats
PROPERTIES
 eats: Obj +-> Obj &
 eats = {fox |-> chicken, chicken |-> grain}
VARIABLES near,far
INVARIANT
 near<:Obj & far<:Obj & near \/ far = Obj & near /\ far = {}
INITIALISATION near,far := Obj,{}
OPERATIONS
  Move_far(x) = PRE farmer:near & x<: near-{farmer} & card(x)<2 & safe(far) THEN
      near,far := (near - {farmer}) - x, far \/ {farmer} \/ x
  END;
  Move_near(x) = PRE farmer:far & x<: far-{farmer} & card(x)<2 & safe(near) THEN
      far,near := (far - {farmer}) - x, near \/ {farmer} \/ x
  END;
  YouLoose = PRE (farmer:near & not(safe(far))) or
                 (farmer:far  & not(safe(near))) THEN skip END
END

