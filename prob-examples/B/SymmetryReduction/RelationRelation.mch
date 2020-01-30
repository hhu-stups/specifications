MACHINE RelationRelation
SETS
 ID
VARIABLES r
INVARIANT /* Invariants are violated */
/* check whether the partial function test does not time out */
 r:(ID<->ID)+-> (ID<->ID) &
 r:POW(ID*ID)+-> (ID<->ID) & /* same as above but using POW and Cartesian product */
 r:POW1(ID*ID)+-> (ID<->ID) & /* now using POW1 and Cartesian product */
 r:(ID+->ID)+-> (ID-->ID)
INITIALISATION r:={}
OPERATIONS
  Add(xx,yy,zz) = PRE xx:ID & yy:ID & zz:ID & card(dom(r))<2 THEN r({xx|->yy}) := {zz |-> zz} END;
  res <-- Get(x) = PRE x:dom(r) THEN
    res := r(x)
  END;
  Diff(x,y,z) = PRE {x|->x}:dom(r) & r({x|->x})= {y|->y} & {z|->z}:dom(r) & z/=x & y/=x & z/=y THEN
   skip  /* With nauty: not detected that Diff is enabled */
  END
END
