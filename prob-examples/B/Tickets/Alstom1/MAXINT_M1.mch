MACHINE MAXINT_M1
DEFINITIONS
 SET_PREF_MAXINT == 2147483647;
 SET_PREF_CLPFD == TRUE
CONSTANTS x
PROPERTIES
 x = MAXINT-1  /* will generate a CLP(FD) overflow; check that Prolog backup works */
OPERATIONS
 r <-- GetX = BEGIN r:=x END
END

