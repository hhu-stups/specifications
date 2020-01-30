MACHINE Dataflow_Reaching_Definitions
/* An encoding of the reaching definitions dataflow analysis plus an example from
   Chapter 9 of the Dragon book */
SETS
 Blocks = {Entry,B1,B2,B3,B4,Exit};  /* The particular Blocks in our example */
 Domain = {d1,d2,d3,d4,d5,d6,d7} /* The Domain of the Dataflow analysis */
DEFINITIONS
  ANIMATION_FUNCTION_DEFAULT == {r,c,i| r:Blocks & c=1 & i=r};
  ANIMATION_FUNCTION == {r,c,i| r:Blocks & (c=2 & i=in(r)) or (c=3 & i=out(r))};
  F(B) == gen(B) \/ (in(B) - kill(B));  /* the TRANSFER FUNCTION */
CONSTANTS next, gen, kill
PROPERTIES
  next: Blocks <-> Blocks &
  gen: Blocks --> POW(Domain) &
  kill: Blocks --> POW(Domain) &

 /* Data: */
 next= {Entry |-> B1, B1|->B2, B2|->B3, B2|->B4, B3|->B4, B4|->Exit, B4|->B2} &
 gen = {B1 |-> {d1,d2,d3},  B2|-> {d4,d5}, B3 |-> {d6}, B4 |-> {d7},  Exit |->{}, Entry |-> {}} &
 kill = {B1 |-> {d4,d5,d6,d7},  B2|-> {d1,d2,d7}, B3 |-> {d3}, B4 |-> {d1,d4},  Exit |->{}, Entry |-> {}} 
VARIABLES in, out, BlocksToTreat, change
INVARIANT
  in: Blocks --> POW(Domain) &
  out: Blocks --> POW(Domain) &
  BlocksToTreat <: Blocks &
  change : BOOL
INITIALISATION out := {Entry |-> {}} \/  (Blocks - {Entry}) * {{}} ||
               in := Blocks * {{}} ||
               BlocksToTreat := (Blocks - {Entry}) ||
               change := FALSE
OPERATIONS
  TreatBlock(B) = SELECT B : BlocksToTreat THEN
      in(B) := UNION(P).(P|->B : next | out(P)) ; /* collect out from predecessors ; meet = UNION */
      change := bool(change=TRUE or out(B) /= F(B) );
      out(B) := F(B) ;  /* apply TRANSFER FUNCTION */
      BlocksToTreat := BlocksToTreat - {B}
  END;
  NewIteration = SELECT BlocksToTreat = {} & change=TRUE THEN
     BlocksToTreat := (Blocks - {Entry}) ||
     change := FALSE
  END;
  Finished = SELECT BlocksToTreat = {} & change=FALSE THEN
     skip
  END
END
