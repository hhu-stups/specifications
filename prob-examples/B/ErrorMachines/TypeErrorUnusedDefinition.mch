MACHINE TypeErrorUnusedDefinition
DEFINITIONS
  Thisisok == 1+1;
  Thisisok2(x) == x+x;
  Thisisok3(x,y) == {x} \/ {y};
  Thisisok4(z) == z \/ yy; // yy could be parameter in Set operation
  Thisisok5(v) == {v,xx};

  TypeErrorDef1 == 1+xx;
  TypeErrorDef2(v) == (v+1=10 & {v,xx}=ID)
SETS
 ID={aa,bb}
CONSTANTS iv
PROPERTIES
 iv:ID
VARIABLES xx
INVARIANT
 xx:ID
INITIALISATION xx:=iv
OPERATIONS
  Set(yy) = PRE yy:ID THEN xx:= yy END
END

