MACHINE SimpleSets
SETS
  base = {elem1,elem2,elem3}
VARIABLES
  set1, set2, set3,
  /*@ unit "1*m**1" */ var,
  z,
  compr
INVARIANT
  set1 : POW(base) &
  set2 : POW(NAT) &
  set3 : POW(NAT) &
  var : NAT &
  z : POW(NAT) &
  compr = {yy,yyy,yyyy | yy > 5 & yyy = 4 & yyyy=5}
INITIALISATION set1,set2,set3,var,z,compr:={},{1},{},0,{},{yy,yyy,yyyy | yy > 5 & yyy = 4 & yyyy = 5}
OPERATIONS
  add_elem_s1(x)  = set1 := set1 \/ x;
  add_elem_s2(x)  = set2 := set2 \/ x;
  in_var(x)       = var  := x;
  type_s_3        = set3 := {var} \/ set3;
  n <-- moreZ(a)  = PRE a : POW(NAT) THEN z := a || n := a END;
  n <-- addZ(f)   = PRE f : POW(NAT) THEN z := z \/ f || n := card(z) + 1 END;
  n <-- subZ(f)   = PRE f : POW(NAT) THEN n := z /\ f END;
  n <-- subZtype  = BEGIN z := z /\ {/*@ unit "1*m**1" */ 1} || n := z /\ {/*@ unit "1*m**1" */ 1} END;
  n <-- setXcardZ = BEGIN n := card(z) END;
  n <-- setdiff   = BEGIN n := set2 - set3 END
END
