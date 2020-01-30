MACHINE SetRelation
SETS
 ID
VARIABLES r
INVARIANT
 r:POW(ID)+-> POW(ID)
INITIALISATION r:={}
OPERATIONS
  Add(yy,zz) = PRE yy:ID & zz:ID & card(dom(r))<2 THEN r({yy}) := {zz} END;
  res <-- Get(x) = PRE x:POW(ID) & x:dom(r) THEN
    res := r(x)
  END;
  Diff(x,y,z) = PRE {x}:dom(r) & r({x})= {y} & {z}:dom(r) & z/=x & y/=x & z/=y THEN
   skip  /* With nauty: was not detected that Diff is enabled ; now ok */
  END
END
