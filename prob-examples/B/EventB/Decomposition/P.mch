MACHINE P
SEES SharedVariables
VARIABLES c,p
INVARIANT
  c:NATURAL & p:BOOL
INITIALISATION
  c:=0 || p := FALSE
OPERATIONS
 output <-- out_c = SELECT p=TRUE THEN
   output := c || p := FALSE
 END;
 ns <-- b2c = SELECT p=FALSE & r/=s THEN
  c := b ||
  p := TRUE ||
  ns := 1-s
 END
END
