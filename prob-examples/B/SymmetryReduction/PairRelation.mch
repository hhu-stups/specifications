MACHINE PairRelation
SETS
 ID
CONSTANTS pair
PROPERTIES pair:INT*INT & pair = (1,2)
VARIABLES r
INVARIANT
 r:(ID*ID)+-> ID
INITIALISATION r:={}
OPERATIONS
 /* Add(yy) = PRE yy:ID THEN r(yy,yy):= yy END; */
  Add(yy,zz) = PRE yy:ID & zz:ID & card(dom(r))<2 THEN
    /*  r := r \/ {(yy,yy) |-> zz} */
     r(yy,yy) := zz 
  END;
  res <-- Get(x,y) = PRE x:ID & y:ID & (x,y):dom(r) THEN
    res := r(x,y)
  END;
  Diff(x,y,z) = PRE (x,x):dom(r) & r(x,x)= y & (z,z):dom(r) & z/=x & y/=x & z/=y THEN
   skip  /* With nauty: not detected that Diff is enabled */
  END
END

