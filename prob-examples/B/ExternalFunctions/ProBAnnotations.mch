MACHINE ProBAnnotations
DEFINITIONS
  "LibraryProB.def";
  "LibraryIO.def";
   SET_PREF_CLPFD == TRUE
SETS
 ID={aa,bb,cc}
ABSTRACT_CONSTANTS halve, halve_sym
PROPERTIES
   halve = FORCE( %x.(x:0..1000 & x mod 2 = 0 | x/2)) &
   halve_sym = ( %x.(x:0..1000 & x mod 2 = 0 | x/2))
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION
  xx:=aa
OPERATIONS
  Test(x,y) = PRE x:1..2 & y:200..300 & x = y mod 3 & ENUMERATE(y) THEN skip END;
  Test2(x,y) = PRE x:{"a","b","c"} & y:{0,22,200000} & ENUMERATE(x) THEN skip END;
  Test3(x,y) = PRE x:{"a","b","c"} & y:{0,22,200000} & ENUMERATE((x,y)) THEN skip END
END

