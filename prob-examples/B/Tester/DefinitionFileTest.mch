MACHINE DefinitionFileTest
DEFINITIONS
  "DefinitionFile.def";
  GRD2 == x<10
 VARIABLES x,y
 INVARIANT INV
 INITIALISATION
  x,y := 5,0
 OPERATIONS
   incY = PRE GRD1 THEN y:=y+1 END;
   incX = PRE GRD2 THEN x:=x+1 END
 END