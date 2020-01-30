MACHINE SortByPermutation
DEFINITIONS
  SET_PREF_MAXINT == 4;
  SET_PREF_MAX_OPERATIONS == 20 
CONSTANTS sz
PROPERTIES sz:NATURAL & sz=4
VARIABLES a
INVARIANT
 a: 1..sz --> INTEGER
INITIALISATION a:= %j.(j:1..sz|0)
OPERATIONS
  res <-- Get(i) = PRE i:1..sz THEN res:=a(i) END;
  Sort = ANY p WHERE p : perm(dom(a)) &
         !(i,j).(i :1..(sz-1) & j:2..sz & i<j =>   a(p(i)) <= a(p(j))) THEN
         a := (p;a)
    END;
  IsSorted = PRE !i.(i:dom(a) => !j.(j:dom(a) & i<j => a(i) <= a(j))) THEN skip END;
  Set(i,val) = PRE i:1..sz & val:INTEGER THEN a(i):= val END;
  Set2(val) = PRE 2:1..sz & val:INTEGER THEN a(2):= val END;
  Set3(val) = PRE 3:1..sz & val:INTEGER THEN a(3):= val END;
  Set4(val) = PRE 4:1..sz & val:INTEGER THEN a(4):= val END
END

