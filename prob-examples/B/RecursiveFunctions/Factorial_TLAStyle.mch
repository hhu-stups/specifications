MACHINE Factorial_TLAStyle
DEFINITIONS
  SET_PREF_MAXINT ==  3;
  SET_PREF_MAX_OPERATIONS == 10
  /* SET_PREF_SYMBOLIC == TRUE; 
  SET_PREF_EXPAND_CLOSURES_FOR_STATE == FALSE  */
SETS
  UnitType = {one}
ABSTRACT_CONSTANTS fac
PROPERTIES
 fac: INTEGER <-> INTEGER &
 fac = (%x.(x : NATURAL1 |  
           ( %y.(y = one & x = 1| 1) \/
             %y.(y = one & x: NATURAL & x>1| x * fac(x-1))) (one)   /* encoding of TLA if-then-else */
            ))
ASSERTIONS
 fac(4) = 24;
 fac(20) = 2432902008176640000;
 !x.(x:2..20 => fac(x) = x*fac(x-1)); /* CLPFD Overflow occurs when checking negation of this */
 {x|fac(x)>10 & x:1..5} = 4..5
OPERATIONS
 r <-- FAC(x) = PRE x: 2..10 THEN r:= fac(x) END
END

