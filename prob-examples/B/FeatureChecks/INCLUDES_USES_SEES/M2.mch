MODEL
   M2
INCLUDES M10
 /* PROMOTES inc */
VARIABLES y
INVARIANT y:INTEGER & y=x+1
INITIALISATION y:=1
OPERATIONS
  incboth = PRE x<9 THEN inc || y:= y+1 END;
  incboth_err =  BEGIN inc || y:= y+1 END   /* Note: inc = PRE x<9 THEN x:=x+1 END in M10 */
END