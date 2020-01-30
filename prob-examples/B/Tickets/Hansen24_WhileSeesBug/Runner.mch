MACHINE Runner
INCLUDES While
VARIABLES a
INVARIANT a : 1..10
INITIALISATION a:= 1
OPERATIONS
 RunnerOp =
  WHILE a < 10
  DO
    a := a + 1;
    Foo
  INVARIANT 1=1
  VARIANT 10 - a
  END;
 r <-- Geta = BEGIN r:=a END
END
