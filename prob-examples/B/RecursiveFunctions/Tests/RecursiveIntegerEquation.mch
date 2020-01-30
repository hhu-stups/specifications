MACHINE RecursiveIntegerEquation
ABSTRACT_CONSTANTS x,y
PROPERTIES
 x:1..10 &
 x = x*x - y &  /* test that this is not detected as a recursive function definition */
 y: 1..2
ASSERTIONS
 x=2;
 y=2
OPERATIONS
  GetXY(a,b) = PRE a=x & b=y THEN skip END
END

