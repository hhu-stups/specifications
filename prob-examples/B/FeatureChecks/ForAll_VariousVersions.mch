MACHINE ForAll_VariousVersions
SETS
 ID={aa,bb,cc,dd,ee}
CONSTANTS f,g,h
PROPERTIES
 f:ID --> ID &
 !x.(x:dom(f) => f(x)=ee) &
 !(x,y).(y|->x:f => x=ee) &
 g:ID --> ID &
 !x.(g(x)=aa => x=aa) &
 !x.(g(x)/=aa => g(x)=bb) &
 h:ID --> ID &
 !y.(y:ID => (y:dom(h) => h(y)=ee))
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  rr <-- GetF(yy) = PRE yy:ID THEN rr:= f(yy) END;
  rr <-- GetG(yy) = PRE yy:ID THEN rr:= g(yy) END;
  rr <-- GetH(yy) = PRE yy:ID THEN rr:= h(yy) END
END

