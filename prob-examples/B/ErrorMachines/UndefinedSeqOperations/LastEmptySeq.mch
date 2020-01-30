MACHINE LastEmptySeq
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:seq(ID) & last(iv)=aa  /* without the conditions below we may apply last to the empty sequence */
  /* & size(iv)>0 & iv /= [] */
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=first(iv)
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  rr <-- LastErr1 = BEGIN rr := last({1|->2,3|->4}) END; /* not detected by avl_max code */
  LastErr1b(rr,x,y) = PRE rr = last({x|->2,y|->4}) & x<y & x:1..2 & y:3..4 THEN skip END;
  rr <-- LastErr2 = BEGIN rr := last({-1|->2,-3|->4}) END;
  rr <-- LastOk1 = BEGIN rr := last({1|->2,3|->4,2|->5}) END;
  LastOk1b(rr,x,y) = PRE rr = last({x|->2,y|->4}) & x<y & x:1..2 & y:2..3 & x+y<4 THEN skip END;
  rr <-- LastOk2 = BEGIN rr := last({1|->2,3|->4,2|->5,4|->20}) END
END

