MACHINE InfiniteAbstractConstantTest
DEFINITIONS SET_PREF_EXPAND_CLOSURES_FOR_STATE == TRUE;
 SET_PREF_MAXINT == 1024
ABSTRACT_CONSTANTS f_inf,f_fin
PROPERTIES
  f_inf = %x.(x:seq(NATURAL1) & size(x)>2|x) &
  f_fin = %x.(x:seq(NATURAL1) & size(x)<=2|x)
VARIABLES ss
INVARIANT
 ss:seq(NATURAL1)
ASSERTIONS
  {ss} = f_inf[{ss}] \/ f_fin[{ss}]
INITIALISATION ss:=[]
OPERATIONS
  Add(yy) = PRE yy:NATURAL1 THEN ss:= ss <- yy END;
  inf = PRE ss : dom(f_inf) THEN skip END;
  fin = PRE ss : dom(f_fin) THEN skip END
END

