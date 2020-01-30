MACHINE SortByPermutation5
DEFINITIONS
  SET_PREF_MAXINT == 11;
 CUSTOM_GRAPH_NODES == { node,col | node : ran(a) \/ dom(a) & col = node};
 CUSTOM_GRAPH_EDGES == { n1,n2 | n1:dom(a) & n1|->n2:a} \/
                 {n1,n2 | n1:ran(a) & n2:ran(a) & n1<n2 & !x.(x:ran(a) => (x<=n1 or x>=n2))}
CONSTANTS sz
PROPERTIES sz:NATURAL & sz=5
VARIABLES a
INVARIANT
 a: 1..sz --> INTEGER
INITIALISATION a:= %j.(j:1..sz|1+2*sz-j)
OPERATIONS
  res <-- Get(i) = PRE i:1..sz THEN res:=a(i) END;
  Sort = ANY p WHERE p : perm(dom(a)) &
         !(i,j).(i :1..(sz-1) & j:2..sz & i<j =>   a(p(i)) <= a(p(j))) THEN
         a := (p;a)
    END
END

