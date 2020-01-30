MACHINE InitCBCCheck
/* check we can use -cbc_sequence or test case generation to cover Goal */
SETS
 ID={aa,bb}
CONSTANTS n
PROPERTIES n: 1..40000
VARIABLES xx,yy,zz
INVARIANT
 xx:1..10000 & yy:1..10000 & zz:1..10000
INITIALISATION xx::1..10000 || yy::1..10000 || zz::1..10000
OPERATIONS
  Goal = SELECT xx < yy & yy < zz & xx >9996 & xx+yy+zz=n THEN skip END
END

