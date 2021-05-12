MACHINE N
SEES SharedVariables
VARIABLES a,m
INVARIANT
  a:NATURAL & m:BOOL
INITIALISATION
  a:=0 || m := FALSE
OPERATIONS
 in_a(aval) = SELECT aval:NATURAL & m=FALSE THEN
   a := aval || m := TRUE
 END;
 nb,nr <-- a2b = SELECT m=TRUE & r=s THEN
  nb := a ||
  m := FALSE ||
  nr := 1-r
 END;

 inc_d = skip
END

