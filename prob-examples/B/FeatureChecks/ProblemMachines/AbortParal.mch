MACHINE AbortParal

VARIABLES a,b,x
INVARIANT a : NATURAL & b : NATURAL & x : NATURAL

INITIALISATION a := 1 || b := 1 || x:=1

OPERATIONS

add_b= b:=b+1;

abort=
 BEGIN 
  SELECT x=1 & not(x=1) THEN skip END /*this SELECT is changed to PRE in XML file */
 END;

AssignAbort = 
 BEGIN
  a:=2 || abort
 END;

SelectAbort = 
 BEGIN
  BEGIN
    abort
  END 
   || 
  BEGIN
    SELECT b=3 THEN a:=2 END 
  END
 END
 


END