MACHINE LargeSequences
/* DEFINITIONS SET_PREF_TIME_OUT == 1200 */
VARIABLES s
INVARIANT
 s:seq(INTEGER)
INITIALISATION s:= %x.(x:1..100|x*x)
OPERATIONS
  r <-- GetSize = BEGIN r := size(s) END;
  Double = BEGIN s := s ^ s END; /* was slow for Size 3200; now fixed */
 /* Double times out sometime in the middle: garbage collection ??
    see whether we have GC issues; maybe normalising AVL_sets unnecessarily */
  HalveLow(i) = PRE i=size(s)/2 THEN s := s /|\ i END;
  HalveUp(i) = PRE i=size(s)/2 THEN s := s  \|/ i END;
  DropMiddle(i) = PRE i=size(s)/2 THEN s := (s /|\ i-1) ^ (s  \|/ i) END;
  AddAtFront = BEGIN s:= 42 -> s END; /* was slow for Size 3200; now fixed */
  AddAtEnd = BEGIN s := s <- 42 END;
  r <-- GetFirst = BEGIN r:= first(s) END;
  r <-- GetLast = BEGIN r:= last(s) END; /* slow for 12800 */
  SetFront = BEGIN s:= front(s) END; /* slow for 12800 */
  SetTail = BEGIN s:= tail(s) END /* was slow for Size 3200; now fixed */
END

