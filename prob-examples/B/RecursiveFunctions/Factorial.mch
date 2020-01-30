MACHINE Factorial
DEFINITIONS
  SET_PREF_MAXINT ==  3;
  SET_PREF_MAX_OPERATIONS == 10
  /* SET_PREF_SYMBOLIC == TRUE; 
  SET_PREF_EXPAND_CLOSURES_FOR_STATE == FALSE  */
ABSTRACT_CONSTANTS fac
PROPERTIES
 fac: INTEGER <-> INTEGER &
 fac = %xb.(xb=1|1) \/ %x.(x>1|x*fac(x-1) )
/* new format: fac = %xb.(xb:NATURAL1|IF xb = 1 THEN 1 ELSE x*fac(x-1) END) */
ASSERTIONS
 fac(4) = 24;
 fac(20) = 2432902008176640000;
 !x.(x:2..20 => fac(x) = x*fac(x-1)) /* CLPFD Overflow occurs when checking negation of this */
OPERATIONS
 r <-- FAC(x) = PRE x: 2..10 THEN r:= fac(x) END
END

