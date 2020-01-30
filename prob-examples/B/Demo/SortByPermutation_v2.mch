MACHINE SortByPermutation_v2
CONSTANTS ia, sz
PROPERTIES
 ia = [4,13,11,2,5,0,6,7,9,1,17] &
 sz = size(ia) /* Time out starts to appear at size 13 */
 /* this runs slower with CLPFD TRUE ! */
VARIABLES a
INVARIANT
 a : seq(NATURAL) & ran(a) = ran(ia)
INITIALISATION a:=ia
OPERATIONS
  Sort(p) = PRE p:perm(dom(a)) & !i.(i:1..(size(a)-1) => a(p(i)) <= a(p(i+1)) ) THEN
     a := (p;a)
  END;
  /*
  Sort2(p) = PRE p:perm(1..size(a)) &
             !(i,j).(i:1..(size(a)-1) & i<j & j:2..size(a) => a(p(i)) <= a(p(j)) ) THEN
    a := (p;a)
  END; */
  r <-- Sorted = IF !i.(i:1..(size(a)-1) => a(i) <= a(i+1)) THEN
           r := TRUE ELSE r:= FALSE
        END;
  el <-- Get(i) = PRE i:1..size(a) THEN el := a(i) END
END

