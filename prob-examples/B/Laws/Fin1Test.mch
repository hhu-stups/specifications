MACHINE Fin1Test
SETS
 ID={aa,bb}
/* DEFINITIONS
  x == (1=1 & y); */
VARIABLES xx
INVARIANT
 {} : FIN(ID) & {} /: FIN1(ID) & xx:ID
INITIALISATION xx:=aa
END

