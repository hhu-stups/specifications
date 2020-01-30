MACHINE SortByPermuationPF
/* The same as SortByPermutation; but allows partial functions */
DEFINITIONS
  SET_PREF_MAXINT == 4;
  SET_PREF_MAX_OPERATIONS == 20 
VARIABLES a
INVARIANT a:  NAT1 +-> INTEGER
INITIALISATION a : (a: NAT1 +-> INTEGER)
OPERATIONS
  prm <-- Sort = ANY p WHERE p : perm(dom(a)) &
         !(i,j).(i:1..size(p) & j:2..size(p) & i<j => a(p(i)) <= a(p(j))) THEN
         a := (p;a) || prm := p
  END;
  res <-- Get(i) = PRE i:dom(a)THEN res:=a(i) END;
  Set(i,val) = PRE i:NAT1 & val:INTEGER THEN a(i):= val END;
  Set2(val) = PRE val:INTEGER THEN a(2):= val END;
  Set3(val) = PRE val:INTEGER THEN a(3):= val END;
  Set4(val) = PRE val:INTEGER THEN a(4):= val END
END
