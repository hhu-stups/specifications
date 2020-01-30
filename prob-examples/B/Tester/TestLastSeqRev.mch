MACHINE TestLast
SETS Nodes={n1,n2,n3,n4,n5}
DEFINITIONS
  SET_PREF_MAXINT == 5
CONSTANTS
 r
PROPERTIES
  r:iseq1(Nodes) & 
  size(r)>2 & 
  last(r) = n3 &
  first(r) = n1 &
  first(tail(r)) = n2 &
  last(front(r)) = n4 &
  first(tail(tail(r))) = n5
VARIABLES
  rr
INVARIANT rr:iseq1(Nodes)
INITIALISATION rr := r
OPERATIONS
 last_n3 = PRE last(rr)=n3 THEN skip END;
 last_not_n3 = PRE last(rr)/=n3 THEN skip END;
 res <-- get_pos(i) = PRE i:1..size(rr) THEN res := rr(i) END;
 ll <-- get_last = ll:= last(rr);
 rev_rr = BEGIN rr:= rev(rr) END
END

