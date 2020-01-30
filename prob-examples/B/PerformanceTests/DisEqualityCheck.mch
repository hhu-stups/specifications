MACHINE DisEqualityCheck
/* Check if Propagation of Disequalities works well */
DEFINITIONS SET_PREF_MAXINT == 12
SETS
 ID={cc,aa,bb,dd,ee,ff}
CONSTANTS m,f
PROPERTIES
 m = 13 &
 f: ID --> 0..m &
 !(x,y).(x:ID & y:ID & x /= y => f(x) /= f(y)) &
 !x.(x:ID => f(x) /= 0 & f(x) /= 6 & f(x) /= 7 &
             f(x) /= 8 & f(x) /= 9 & f(x) /= 10 & f(x) /= 11 & f(x) /= 13) &
 f(aa) /= 1 & f(aa) /= 2 & f(aa) /= 3 & f(aa) /= 5 & f(aa) /= 4 &
 f(bb) /= 1 & f(bb) /= 2 & f(bb) /= 3 & f(bb) /= 5 &
 f(cc) /= 2 & f(cc) /= 3 & f(cc) /= 5 &
 f(dd) /= 3 & f(dd) /= 5 &
 f(ee) /= 5
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=aa
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END;
  r <-- GetF = BEGIN r:= f(xx) END
END

