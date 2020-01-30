MACHINE Consts_Eboc
// the Consts model from the Eboc ICFEM'09 paper (Appendix A)
// bounded model checking finds a problem straight away
DEFINITIONS
 SET_PREF_RANDOMISE_ENUMERATION_ORDER == TRUE
CONSTANTS c1, c2
PROPERTIES
 c1 < c2
VARIABLES x
INVARIANT
 /*@label inv1 */ (c1=2 => x /= 150) &
 /*@label inv2 */ (x>=-5000) & (x<=5000)
INITIALISATION x := 0
OPERATIONS
  e1(xx) = PRE xx:INTEGER THEN x := x+xx END;
  e2(xx) = SELECT xx>c2 THEN x:= xx+x+c1 END;
  e3 = BEGIN x:= c1+c2+x END
END

