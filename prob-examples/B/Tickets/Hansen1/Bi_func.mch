MACHINE Bi_func
DEFINITIONS SET_PREF_MAXINT == 3; SET_PREF_CLPFD == TRUE
VARIABLES xx
INVARIANT
 xx: POW(INTEGER)
ASSERTIONS
  card({t| #x.(x : 1..4 >->> {4,5,6,7} & t = x(1)) }) = 4
INITIALISATION xx:={}
OPERATIONS
  Set = ANY yy WHERE yy = {t| #x.(x : 1..4 >->> {4,5,6,7} & t = x(1)) } THEN xx:= yy END;
 set2 = ANY yy WHERE yy = {t| #x.(x :{4,5,6,7}& t = x) } THEN xx:= yy END;
 El(y) = SELECT y:xx THEN skip END;
 c <-- GetCard = c:=card(xx)
END

