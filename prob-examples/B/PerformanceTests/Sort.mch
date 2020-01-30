MACHINE
   Sort
CONSTANTS iarray
PROPERTIES
    iarray:iseq(NATURAL)  &
    /* For animation : */
    size(iarray) = 4  & ran(iarray)={0,1,3,5} 
    & iarray(1)=5 & iarray(4)=0
DEFINITIONS
   SET_PREF_MAXINT == 4;  /* should work even though we have 5 above */
   is_sorted(a) ==
      !(i,j).(i:NAT1 & j:NAT1 & i:dom(a) & j:dom(a) & i<j => a(i) < a(j))
VARIABLES array,sorted
INVARIANT
   array:iseq(NATURAL) & sorted:BOOL &
   ran(iarray) = ran(array) & size(iarray) = size(array) &
   (sorted=TRUE => is_sorted(array))
INITIALISATION
   array := iarray || sorted := FALSE
OPERATIONS
 /* permute = ANY p,a WHERE p: perm(1..size(array))
                        & a:seq(NATURAL) & a=(p;array)   THEN
     array := a ||
     sorted := FALSE
   END;
 arr_is_sorted = SELECT is_sorted(array) THEN skip END; */
 sort = ANY p,a WHERE p: perm(1..size(array))
                        & a:seq(NATURAL) & a=(p;array) &
                        is_sorted(a) THEN
     array := a ||
     sorted := TRUE
   END;
 r <-- getel(indx) = PRE indx: 1.. size(array) THEN
      r := array(indx)
   END
END
