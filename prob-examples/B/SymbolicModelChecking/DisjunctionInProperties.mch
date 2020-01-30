MACHINE DisjunctionInProperties
SETS
 ID={aa,bb}
CONSTANTS x,y,z, mutant
PROPERTIES
 x:1..10 &
 y:20..40 &
 (z = x & mutant=1 or z=y & mutant=2)
VARIABLES v
INVARIANT
 v:NATURAL & v<999
INITIALISATION v:=z
OPERATIONS
  Test1 = SELECT x=y THEN v := 3000 END;
  Test2 = SELECT v>35 THEN v := 2000 END
END

